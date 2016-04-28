module Users
  # Omniauth
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def twitter
      @user = User.find_or_create_from_twitter(request.env['omniauth.auth'])
      if @user.persisted?
        sign_in(@user)
        redirect_to profile_path(name: @user.name)
      else
        redirect_to new_user_session_path
      end
    end
  end
end
