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
    flv.transcode(mp4_path, options) do |progress|
      puts progress
    end
    save_record(@user, mp4_path)
    File.delete("/usr/local/nginx/html/hls/#{@user.streaming_key}.flv")
    File.delete(mp4_path)
    render nothing: true, status: 200
  end

  private

  def save_record(user, mp4_path)
    record = user.records.create
    upload_to_s3(user, record, mp4_path)
  end

  def upload_to_s3(user, record, mp4_path)
    s3 = AWS::S3.new
    bucket = s3.buckets['live-streaming-staging']
    obj = bucket.objects["#{user.uid}/records/#{record.uuid}.mp4"]
    obj.write(File.open(mp4_path))
    obj.acl = :public_read
    record.update(path: obj.key)
  end
end
