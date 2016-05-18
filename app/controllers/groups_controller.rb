class GroupsController < ApplicationController
  def create
    render json: group_params
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
