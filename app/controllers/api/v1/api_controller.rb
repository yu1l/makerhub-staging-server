module Api
  module V1
    class ApiController < ActionController::Base
      include Pundit
      protect_from_forgery with: :null_session
      before_action :doorkeeper_authorize!
      respond_to    :json
    end
  end
end
