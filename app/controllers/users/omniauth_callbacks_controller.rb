module Users
  class OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def callback_from_providers
      @user = User.find_from_auth(request.env['omniauth.auth'], current_user)
      sign_in(@user)
      redirect_to profile_path(name: @user.name)
    rescue
      redirect_to new_user_session_path
    end

    alias_method :twitter, :callback_from_providers
    alias_method :github, :callback_from_providers
  end
end
