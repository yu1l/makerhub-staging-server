class RecordsController < ApplicationController
  def play
    @user = User.find_by(name: params[:name])
    @record = @user.records.find_by(uuid: params[:uuid])
  end
end
