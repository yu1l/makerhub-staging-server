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

FactoryGirl.define do
  factory :record do
    video_path 'somewhere'
    screenshot_path 'somewhere'
    uuid "#{(('a'..'z').to_a.sample(3) + ('A'..'Z').to_a.sample(3) + (0..9).to_a.sample(3)).join}"
    title "#{(('a'..'z').to_a.sample(3) + ('A'..'Z').to_a.sample(3) + (0..9).to_a.sample(3)).join}"
    duration 0
    total 0
    category 0
    uploaded true
  end
end
