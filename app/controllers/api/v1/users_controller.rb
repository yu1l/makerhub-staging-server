class Api::V1::UsersController < Api::V1::ApiController
  def followings
    @user = User.find_by(user_params)
    @followings = @user.all_following.map do |f|
      {
        name: f.name,
        nickname: f.gh.nickname,
        avatar: f.gh.image
      }
    end
    render json: { followings: @followings }
  end

  def followers
    @user = User.find_by(user_params)
    @followers = @user.followers.map do |f|
      {
        name: f.name,
        nickname: f.gh.nickname,
        avatar: f.gh.image
      }
    end
    render json: { followers: @followers }
  end

  private

  def user_params
    params.permit(:nickname)
  end
end
