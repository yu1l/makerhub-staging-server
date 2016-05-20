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

require 'rails_helper'

RSpec.describe RecordsController, type: :controller do
end
