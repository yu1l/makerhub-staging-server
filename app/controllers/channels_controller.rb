class ChannelsController < ApplicationController
  include Contracts::Core
  include Contracts::Builtin

  before_action :authenticate_user!

  def block
    @user = User.find_by(user_params)
    current_user.channel.block(@user)
    render nothing: true, status: 200
  end

  def unblock
    @user = User.find_by(user_params)
    current_user.channel.unblock(@user)
    render nothing: true, status: 200
  end

  private

  Contract Hash => Hash
  def user_params
    params.require(:user).permit(:nickname)
  end
end
