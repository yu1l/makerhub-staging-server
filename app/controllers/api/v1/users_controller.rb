class Api::V1::UsersController < Api::V1::ApiController
  include Contracts::Core
  include Contracts::Builtin

  skip_before_action :doorkeeper_authorize!, only: [:followings, :followers]

  Contract None => ArrayOf[String]
  def me
    user = current_resource_owner
    data = {
      uuid: user.uuid,
      email: user.gh.email,
      name: user.gh.name,
      nickname: user.gh.nickname
    }
    render json: { user: data }
  end

  Contract None => ArrayOf[String]
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

  Contract None => ArrayOf[String]
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

  Contract Bool => User
  def current_resource_owner
    User.find(doorkeeper_token.resource_owner_id) if doorkeeper_token
  end

  Contract Hash => Hash
  def user_params
    params.permit(:nickname)
  end
end
