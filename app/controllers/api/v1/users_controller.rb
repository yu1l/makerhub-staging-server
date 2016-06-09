class Api::V1::UsersController < Api::V1::ApiController
  skip_before_action :doorkeeper_authorize!, only: [:followings, :followers]

  def me
    render json: { user: current_resource_owner }
  end

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

  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  def user_params
    params.permit(:nickname)
  end
end
