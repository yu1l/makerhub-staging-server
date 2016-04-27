# Streaming
class StreamController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:record_done]
  def record_done
    flv = FFMPEG::Movie.new(params[:path])
    name = params[:name]
    options = '-vcodec copy -acodec copy'
    flv.transcode("tmp/#{name}.mp4", options) do |progress|
      puts progress
    end
    save_record(name, "tmp/#{name}.mp4")
    File.delete(params[:path])
    File.delete("tmp/#{name}.mp4")
    render nothing: true, status: 200
  end

  private

  def save_record(name, mp4_path)
    record = Record.create
    upload_to_s3(record, name, mp4_path)
  end

  def upload_to_s3(record, name, mp4_path)
    s3 = AWS::S3.new
    bucket = s3.buckets['live-streaming-staging']
    obj = bucket.objects["yhoshino11/records/#{record.id}/#{name}.mp4"]
    obj.write(File.open(mp4_path))
    record.update(path: obj.key)
  end
end
