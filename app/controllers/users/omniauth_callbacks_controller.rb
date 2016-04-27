module Users
  # Omniauth
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
      @user = User.find_or_create_from_twitter(request.env['omniauth.auth'])
      if @user.persisted?
        redirect_to root_path
      else
        redirect_to new_user_session_path
      end
    end
  end
end
