class ChannelsController < ApplicationController
  include Contracts::Core
  include Contracts::Builtin

  before_action :authenticate_user!
  rescue_from Exception, with: :respond_with_500

  def block
    @user = User.find_by(user_params)
    authorize(@user, :other?)
    current_user.channel.block(@user)
    render nothing: true, status: 200
  end

  def unblock
    @user = User.find_by(user_params)
    authorize(@user, :other?)
    current_user.channel.unblock(@user)
    render nothing: true, status: 200
  end

  def respond_with_500
    render nothing: true, status: 500
  end

  private

  Contract Hash => Hash
  def user_params
    params.require(:user).permit(:nickname)
  end
end
