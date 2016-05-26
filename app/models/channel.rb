# == Schema Information
#
# Table name: channels
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  category    :integer
#  description :text
#  live        :boolean
#  private     :boolean
#  title       :string
#  total       :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Channel < ActiveRecord::Base
  belongs_to :user
  acts_as_followable
end
