class Api::V1::StreamsController < Api::V1::ApiController
  include Contracts::Core
  include Contracts::Builtin

  skip_before_action :doorkeeper_authorize!, only: [:all, :user, :comments]

  Contract None => ArrayOf[String]
  def all
    @users = User.where(live: true).map do |u|
      {
        thumbnail: "http://makerhub.live/screenshot/#{u.gh.nickname}.png",
        title: u.title,
        summary: u.description,
        viewers: u.total,
        category: u.category_in_text,
        user: {
          name: u.name,
          nickname: u.gh.nickname,
          avatar: u.gh.image
        }
      }
    end

    render json: { streams: @users }
  end

  Contract Hash => ArrayOf[String]
  def user
    u = User.find_by(user_params)
    @user =  {
        title: u.title,
        summary: u.description,
        viewers: u.total,
        category: u.category_in_text,
        user: {
          name: u.name,
          nickname: u.gh.nickname,
          avatar: u.gh.image
        }
      }
    render json: @user
  end

  def update
    @user = User.find_by(user_params)
    return render nothing: true, status: 500 unless @user.gh.nickname == params[:current_user_nickname]
    return render nothing: true, status: 200 if params[:title].present? && @user.update(update_params)
    render nothing: true, status: 500
  rescue
    render nothing: true, status: 500
  end

  Contract Hash => ArrayOf[String]
  def comments
    @user = User.find_by(user_params)
    @chats = @user.chats.all.map do |c|
      u = User.find_by(nickname: c.sender)
      {
        text: c.text,
        user: {
          name: u.name,
          nickname: u.gh.nickname,
          avatar: u.gh.image
        }
      }
    end
    render json: { comments: @chats }
  end

  private

  Contract Hash => Hash
  def user_params
    params.permit(:nickname)
  end

  Contract Hash => Hash
  def update_params
    params.permit(:title)
  end
end
