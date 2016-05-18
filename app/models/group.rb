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

class Group < ActiveRecord::Base
  has_many :user_groups
  has_many :users, through: :user_groups

  has_many :records

  before_create do
    self.private = true
    self.uuid = ((0..9).to_a.sample(3) +
                 ('a'..'z').to_a.sample(3) +
                 ('A'..'Z').to_a.sample(3)
                ).shuffle.join
  end
end
