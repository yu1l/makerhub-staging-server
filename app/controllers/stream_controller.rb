# Streaming
class StreamController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:on_record_done, :on_publish, :chat]

  def chat
    @user = User.find_by(name: params[:name])
    @chat = @user.chats.create(sender: current_user.name, text: params[:chat][:text])
    @chats = @user.chats.all
    @pushould = Pushould.new(server_token: ENV['SERVER_TOKEN'],
                             url: ENV['URL'],
                             email: ENV['EMAIL'],
                             password: ENV['PASSWORD'])

    @pushould.trigger(room: @user.name,
                      event: 'send',
                      data: {
                        dummy: "#{@chat.sender}:#{@chat.text}"
                      })
    render :chat
  end

  def user
    @user = User.find_by(name: params[:name])
    description = HTML::Pipeline::MarkdownFilter.new(@user.description)
    @content = description.call
    @url = ENV['URL']
    @client_token = ENV['CLIENT_TOKEN']
    @channel = @user.name
    @chats = @user.chats.all
    @chat = @user.chats.new
  end

  def all
    @users = User.where(live: true)
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
    @record.update(uploaded: false, title: @user.title)
    while !File.exist?("/usr/local/nginx/html/screenshot/#{@user.streaming_key}.png") do
      sleep 1
    end
    @record.copy_screenshot_and_video_to_tmp(params[:path])
    @record.delay.upload_to_s3(params[:path])
    render nothing: true, status: 200
  end
end
