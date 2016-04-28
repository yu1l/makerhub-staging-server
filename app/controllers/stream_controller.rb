# Streaming
class StreamController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:on_record_done, :on_publish]

  def on_publish
    @user = User.find_by(streaming_key: params[:name])
    @user.update(live: true)
    render nothing: true, status: 200
  end

  def on_record_done
    flv = FFMPEG::Movie.new(params[:path])
    @user = User.find_by(streaming_key: params[:name])
    options = '-vcodec copy -acodec copy'
    mp4_path = "tmp/#{@user.streaming_key}.mp4"
    screenshot_path = "/usr/local/nginx/html/screenshot/#{@user.streaming_key}.png"
    flv.transcode(mp4_path, options) do |progress|
      puts progress
    end
    save_record(@user, mp4_path, screenshot_path)
    File.delete("/usr/local/nginx/html/hls/#{@user.streaming_key}.flv")
    File.delete(mp4_path)
    File.delete(screenshot_path)
    render nothing: true, status: 200
  end

  private

  def save_record(user, mp4_path, screenshot_path)
    record = user.records.create
    upload_to_s3(user, record, mp4_path, screenshot_path)
  end

  def upload_to_s3(user, record, mp4_path, screenshot_path)
    s3 = AWS::S3.new
    bucket = s3.buckets['live-streaming-staging']

    # Screenshot
    screenshot = bucket.objects["#{user.uuid}/screenshot/#{record.uuid}.png"]
    screenshot.write(File.open(screenshot_path))
    screenshot.acl = :public_read

    # Video
    video = bucket.objects["#{user.uuid}/records/#{record.uuid}.mp4"]
    video.write(File.open(mp4_path))
    video.acl = :public_read

    record.update(video_path: video.key, screenshot_path: screenshot.key)
  end
end
