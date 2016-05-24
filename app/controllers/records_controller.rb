# == Schema Information
#
# Table name: records
#
#  id              :integer          not null, primary key
#  video_path      :string
#  screenshot_path :string
#  uuid            :string
#  uploaded        :boolean
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  title           :string
#  duration        :float
#  total           :integer
#  category        :integer
#  private         :boolean
#  group_id        :integer
#

class RecordsController < ApplicationController
  def play
    @user = User.find_by(nickname: params[:nickname])
    @record = @user.records.find_by(uuid: params[:uuid])
    total = @record.total
    total += 1
    @record.update(total: total)
    @record.reload
  rescue
    return redirect_to stream_path(nickname: @user.nickname) unless @user.nil?
    redirect_to root_path
  end
end
