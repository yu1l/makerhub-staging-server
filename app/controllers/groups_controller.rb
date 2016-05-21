# == Schema Information
#
# Table name: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  private    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uuid       :string
#  streaming  :boolean
#

class GroupsController < ApplicationController
  def create
    @user = User.find_by(name: params[:name])
    authorize(@user, :me?)
    @group = current_user.groups.create(group_params)
    current_user.user_groups.find_by(group_id: @group.id).admin!
    redirect_to profile_path(name: current_user.name)
  rescue
    redirect_to root_path
  end

  def invite
    @user = User.find_by(uuid: params[:user_uuid])
    authorize(@user, :other?)
    @group = current_user.groups.find_by(uuid: params[:uuid])
    @guest = User.find_by(uuid: params[:user_uuid])
    @guest.user_groups.create(group_id: @group.id).guest!
    redirect_to profile_path(name: current_user.name)
  rescue
    redirect_to root_path
  end

  private

  def group_params
    params.require(:group).permit(:name)
  end
end
