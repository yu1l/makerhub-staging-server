# Streaming
class StreamController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:on_record_done, :on_publish]

  def all
    @users = User.all
  end

  def on_publish
    @user = User.find_by(streaming_key: params[:name])
    @user.update(live: true)
    render nothing: true, status: 200
  end

  def on_record_done
    @user = User.find_by(streaming_key: params[:name])
    @user.update(live: false)
    @record = @user.records.create
    @record.update(uploaded: false)
    while !File.exist?("/usr/local/nginx/html/screenshot/#{@user.streaming_key}.png") do
      sleep 1
    end
    # @record.copy_screenshot_and_video_to_tmp(params[:path])
    @record.delay.upload_to_s3(params[:path])
    render nothing: true, status: 200
  end
end
