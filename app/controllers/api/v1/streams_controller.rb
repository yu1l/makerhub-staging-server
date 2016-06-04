class Api::V1::StreamsController < Api::V1::ApiController
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
    return render nothing: true, status: 200 if @user.update(update_params)
    render nothing: true, status: 500
  end

  private

  def user_params
    params.permit(:nickname)
  end

  def update_params
    params.permit(:title)
  end
end
