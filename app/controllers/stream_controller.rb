# Streaming
class StreamController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:on_record_done, :on_publish, :chat, :screenshot_done, :current, :on_play]

  def screenshot_done
    @user = User.find_by(nickname: params[:name])
    return render nothing: true, status: 200 unless @user.live?
    # screenshot_path = "/usr/local/nginx/html/screenshot/#{@user.nickname}.png"
    # if File.exist?(screenshot_path) && !File.exist?("tmp/#{@user.nickname}.png") && File.size(screenshot_path) > 0
      # puts 'thumbnail created'
      # File.copy_stream(screenshot_path, "tmp/#{@user.nickname}.png")
      # File.copy_stream(screenshot_path, "public/#{@user.uuid}_current.png")
    # else
      # File.exist?("tmp/#{@user.nickname}.png")
      # File.exist?("public/#{@user.uuid}_current.png")
    # end
    render nothing: true, status: 200
  end

  def extract_chat
    @user = User.find_by(nickname: params[:nickname])
    @url = ENV['URL']
    @client_token = ENV['CLIENT_TOKEN']
    @channel = @user.nickname
    @chats = @user.chats.all
    @chat = @user.chats.new
    render layout: false
  rescue
    redirect_to root_path
  end

  def current
    @user = User.find_by(nickname: params[:nickname])
    @pushould = Pushould.new(server_token: ENV['SERVER_TOKEN'],
                             url: ENV['URL'],
                             email: ENV['EMAIL'],
                             password: ENV['PASSWORD'])

    @pushould.trigger(room: @user.nickname,
                      event: 'check',
                      data: {})
    render nothing: true, status: 200
  rescue
    render nothing: true, status: 500
  end

  def chat
    @user = User.find_by(nickname: params[:nickname])
    @chat = @user.chats.create(sender: current_user.nickname, text: params['chat']['text'])
    @chats = @user.chats.all
    @pushould = Pushould.new(server_token: ENV['SERVER_TOKEN'],
                             url: ENV['URL'],
                             email: ENV['EMAIL'],
                             password: ENV['PASSWORD'])

    @sender = User.find_by(nickname: @chat.sender)
    @pushould.trigger(room: @user.nickname,
                      event: 'send',
                      data: {
                        name: "#{@sender.name}",
                        image: "#{@sender.gh.image}",
                        nickname: "#{@sender.nickname}",
                        text: "#{@chat.text}"
                      })
    render :chat, status: 200
  rescue
    render nothing: true, status: 500
  end

  def user
    @user = User.find_by(nickname: params[:nickname])
    # return render json: { status: 500 } if @user.private_stream? && !user_signed_in?
    return redirect_to root_path if @user.private? && !user_signed_in?
    @streaming_group = @user.groups.find_by(streaming: true)
    return redirect_to root_path if @user.private? && @streaming_group.users.exclude?(current_user)
    if @user.live?
      total = @user.total
      total += 1
      @user.update(total: total)
      @pushould = Pushould.new(server_token: ENV['SERVER_TOKEN'],
                               url: ENV['URL'],
                               email: ENV['EMAIL'],
                               password: ENV['PASSWORD'])

      @pushould.trigger(room: @user.nickname,
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
    @channel = @user.nickname
    @chats = @user.chats.all
    @chat = @user.chats.new
  rescue
    redirect_to root_path
  end

  def all
    @users = User.where(live: true)
  end

  def on_play
    # puts params[:addr]
    # puts request.remote_ip
    return render nothing: true, status: 500 if params[:swfurl] == ''
    render nothing: true, status: 200
  end

  def on_publish
    @user = User.find_by(streaming_key: params[:token])
    @user.update(total: 0)
    @user.update(live: true)
    render nothing: true, status: 200
  rescue
    render nothing: true, status: 500
  end

  def on_record_done
    @user = User.find_by(streaming_key: params[:token])
    @record = @user.records.create
    @record.update(uploaded: false, title: @user.title, total: @user.total)
    @user.update(live: false, total: 0)
    return if !File.exist?("/usr/local/nginx/html/screenshot/#{@user.nickname}.png")
    @record.copy_screenshot_to_tmp(params[:path])
    @record.delay.copy_video_to_tmp(params[:path])
    @record.delay.upload_to_s3(params[:path])
    # begin
      # File.delete("tmp/#{@user.nickname}.png")
      # File.delete("public/#{@user.uuid}_current.png")
    # rescue
      # puts 'tmp screenshot does not exist'
    # end
    if @user.private?
      @group = @user.groups.find_by(streaming: true)
      @record.delay.update(private: true, group_id: @group.id)
    end
    render nothing: true, status: 200
  end
end
