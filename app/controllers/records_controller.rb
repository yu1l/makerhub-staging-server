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
#

class RecordsController < ApplicationController
  def play
    @user = User.find_by(name: params[:name])
    @record = @user.records.find_by(uuid: params[:uuid])
    total = @record.total
    total += 1
    @record.update(total: total)
    @record.reload
  end
end
