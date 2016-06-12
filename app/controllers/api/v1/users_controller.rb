module Api
  module V1
    class UsersController < Api::V1::ApiController
      include Contracts::Core
      include Contracts::Builtin

      skip_before_action :doorkeeper_authorize!, only: [:followings, :followers]

      Contract None => ArrayOf[String]
      def me
        render json: { user: current_resource_owner.api_info }
      end

      Contract None => ArrayOf[String]
      def followings
        @user = User.find_by(user_params)
        render json: { followings: @user.following_people }
      end

      Contract None => ArrayOf[String]
      def followers
        @user = User.find_by(user_params)
        render json: { followers: @user.follower_people }
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
  end
end
