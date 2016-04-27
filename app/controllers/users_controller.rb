class UsersController < ApplicationController
  def profile
    @user = User.find_by(name: params[:name])
  end

  def stream
    @user = User.find_by(name: params[:name])
  end
end
