# Streaming
class StreamController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:record_done]
  def record_done
    flv = FFMPEG::Movie.new(params[:path])
    name = params[:name]
    options = '-vcodec copy -acodec copy'
    flv.transcode("public/#{name}.mp4", options) do |progress|
      puts progress
    end
    File.delete(params[:path])
    render nothing: true, status: 200
  end
end
