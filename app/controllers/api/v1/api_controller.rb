class Api::V1::ApiController < ActionController::Base
  include Pundit
  protect_from_forgery with: :null_session
end
