# Streaming
class StreamController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:on_record_done, :on_publish, :chat, :screenshot_done]

  def screenshot_done
    @user = User.find_by(streaming_key: params[:name])
    screenshot_path = "/usr/local/nginx/html/screenshot/#{params[:name]}.png"
    if File.exist?(screenshot_path) && !File.exist?("tmp/#{params[:name]}.png") && File.size(screenshot_path) > 0
      puts 'thumbnail created'
      File.copy_stream(screenshot_path, "tmp/#{params[:name]}.png")
      File.copy_stream(screenshot_path, "public/#{@user.uuid}_current.png")
    else
      File.exist?("tmp/#{params[:name]}.png")
      File.exist?("public/#{@user.uuid}_current.png")
    end
    render nothing: true, status: 200
  end

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
    description = HTML::Pipeline::MarkdownFilter.new("#{@user.description || 'There is no description.'}")
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
    File.delete("tmp/#{params[:name]}.png")
    File.delete("public/#{@user.uuid}_current.png")
    @record = @user.records.create
    @record.update(uploaded: false, title: @user.title)
    while !File.exist?("/usr/local/nginx/html/screenshot/#{@user.streaming_key}.png") do
      sleep 1
    end
    @record.copy_screenshot_to_tmp(params[:path])
    @record.delay.copy_video_to_tmp(params[:path])
    @record.delay.upload_to_s3(params[:path])
    render nothing: true, status: 200
  end
end
