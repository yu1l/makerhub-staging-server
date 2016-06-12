module Api
  module V1
    class VideosController < Api::V1::ApiController
      include Contracts::Core
      include Contracts::Builtin

      skip_before_action :doorkeeper_authorize!, only: [:all, :user, :video]

      def all
        @videos = Record.all.map(&:public_attributes_with_thumbnail)
        render json: { videos: @videos }
      end

      def user
        @user = User.find_by(user_params)
        @videos = @user.records.map(&:public_attributes_with_thumbnail)
        render json: @videos
      end

      def video
        @user = User.find_by(user_params)
        @video = @user.records.find_by(record_params)
        render json: @video.public_attributes_with_thumbnail
      end

      def update
        @user = User.find_by(user_params)
        @video = @user.records.find_by(record_params)
        return render nothing: true, status: 500 if invalid_user_from_api(params, @user)
        return render nothing: true, status: 200 if update_category(patch_params[:category], @video)
        return render nothing: true, status: 200 if update_title(params[:title], @video, patch_params)
        render nothing: true, status: 500
      rescue
        render nothing: true, status: 500
      end

      private

      def update_title(title, video, title_params)
        return true if title.present? && video.update(title_params)
        false
      end

      def update_category(category_text, video)
        return true if category_text.present? && video.update(category: text_to_int_category(category_text))
        false
      end

      def invalid_user_from_api(params, user)
        return true if params[:current_user_nickname].nil?
        return true if user.nil?
        return true if user.default_nickname != params[:current_user_nickname]
        false
      end

      def text_to_int_category(text)
        %w(UI/UX Ruby Python).each_with_index { |lang, index| return index if lang == text }
      end

      def user_params
        params.permit(:nickname)
      end

      def record_params
        params.permit(:uuid)
      end

      def patch_params
        params.permit(:title, :category)
      end
    end
  end
end
