# Streaming
class StreamController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:on_record_done, :on_publish, :chat, :screenshot_done, :current]

  def screenshot_done
    @user = User.find_by(name: params[:name])
    return render nothing: true, status: 200 unless @user.live?
    screenshot_path = "/usr/local/nginx/html/screenshot/#{@user.name}.png"
    if File.exist?(screenshot_path) && !File.exist?("tmp/#{@user.name}.png") && File.size(screenshot_path) > 0
      puts 'thumbnail created'
      File.copy_stream(screenshot_path, "tmp/#{@user.name}.png")
      File.copy_stream(screenshot_path, "public/#{@user.uuid}_current.png")
    else
      File.exist?("tmp/#{@user.name}.png")
      File.exist?("public/#{@user.uuid}_current.png")
    end
    render nothing: true, status: 200
  end

  def extract_chat
    @user = User.find_by(name: params[:name])
    @url = ENV['URL']
    @client_token = ENV['CLIENT_TOKEN']
    @channel = @user.name
    @chats = @user.chats.all
    @chat = @user.chats.new
    render layout: false
  rescue
    redirect_to root_path
  end

  def current
    @user = User.find_by(name: params[:name])
    @pushould = Pushould.new(server_token: ENV['SERVER_TOKEN'],
                             url: ENV['URL'],
                             email: ENV['EMAIL'],
                             password: ENV['PASSWORD'])

    @pushould.trigger(room: @user.name,
                      event: 'check',
                      data: {})
    render nothing: true, status: 200
  rescue
    render nothing: true, status: 500
  end

  def chat
    @user = User.find_by(name: params[:name])
    @chat = @user.chats.create(sender: current_user.name, text: params[:chat][:text])
    @chats = @user.chats.all
    @pushould = Pushould.new(server_token: ENV['SERVER_TOKEN'],
                             url: ENV['URL'],
                             email: ENV['EMAIL'],
                             password: ENV['PASSWORD'])

    @sender = User.find_by(name: @chat.sender)
    @pushould.trigger(room: @user.name,
                      event: 'send',
                      data: {
                        name: "#{@chat.sender}",
                        image: "#{@sender.twitter_image_url}",
                        nickname: "#{@sender.twitter_name}",
                        text: "#{@chat.text}"
                      })
    render :chat
  rescue
    render nothing: true, status: 500
  end

  def user
    @user = User.find_by(name: params[:name])
    if @user.live?
      total = @user.total
      total += 1
      @user.update(total: total)
      @pushould = Pushould.new(server_token: ENV['SERVER_TOKEN'],
                               url: ENV['URL'],
                               email: ENV['EMAIL'],
                               password: ENV['PASSWORD'])

      @pushould.trigger(room: @user.name,
                        event: 'view',
                        data: {
                          views: total
                        })
    else
      if @user.records.count == 0
        @total = @user.total
      else
        @total = @user.total + @user.records.map(&:total).inject(:+)
      end
    end
    description = HTML::Pipeline::MarkdownFilter.new("#{@user.description || 'There is no description.'}")
    @content = description.call
    @url = ENV['URL']
    @client_token = ENV['CLIENT_TOKEN']
    @channel = @user.name
    @chats = @user.chats.all
    @chat = @user.chats.new
  rescue
    redirect_to root_path
  end

  def all
    @users = User.where(live: true)
  end

  def on_publish
    begin
      @user = User.find_by(streaming_key: params[:token])
      @user.update(total: 0)
      @user.update(live: true)
    rescue
      return render nothing: true, status: 500
    end
    render nothing: true, status: 200
  end

  def on_record_done
    @user = User.find_by(streaming_key: params[:token])
    @record = @user.records.create
    @record.update(uploaded: false, title: @user.title, total: @user.total)
    @user.update(live: false, total: 0)
    while !File.exist?("/usr/local/nginx/html/screenshot/#{@user.name}.png") do
      sleep 1
    end
    @record.copy_screenshot_to_tmp(params[:path])
    @record.delay.copy_video_to_tmp(params[:path])
    @record.delay.upload_to_s3(params[:path])
    begin
      File.delete("tmp/#{@user.name}.png")
      File.delete("public/#{@user.uuid}_current.png")
    rescue
      puts 'tmp screenshot does not exist'
    end
    render nothing: true, status: 200
  end
end
