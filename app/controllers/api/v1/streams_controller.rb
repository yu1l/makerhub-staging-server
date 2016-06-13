module Api
  module V1
    class StreamsController < Api::V1::ApiController
      include Contracts::Core
      include Contracts::Builtin

      skip_before_action :doorkeeper_authorize!, only: [:all, :user, :comments]

      Contract None => ArrayOf[String]
      def all
        @users = User.where(live: true).map(&:public_attributes_with_thumbnail)
        render json: { streams: @users }
      end

      Contract Hash => ArrayOf[String]
      def user
        @user = User.find_by(user_params)
        render json: @user.public_attributes
      end

      def update
        @user = User.find_by(user_params)
        return render nothing: true, status: 200 if valid_user_from_api(params, @user) && @user.update(update_params)
        render nothing: true, status: 500
      rescue
        render nothing: true, status: 500
      end

      Contract Hash => ArrayOf[String]
      def comments
        @user = User.find_by(user_params)
        @chats = @user.chats.all.map(&:detail)
        render json: { comments: @chats }
      end

      private

      def valid_user_from_api(params, user)
        return false if params[:title].nil?
        return false if params[:current_user_nickname].nil?
        return false if user.nil?
        return false if user.default_nickname != params[:current_user_nickname]
        true
      end

      Contract Hash => Hash
      def user_params
        params.permit(:nickname)
      end

      Contract Hash => Hash
      def update_params
        params.permit(:title)
      end
    end
  end
end
