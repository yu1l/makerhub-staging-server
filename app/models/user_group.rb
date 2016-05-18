# == Schema Information
#
# Table name: user_groups
#
#  id         :integer          not null, primary key
#  user_id    :integer
#  group_id   :integer
#  role       :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class UserGroup < ActiveRecord::Base
  belongs_to :user
  belongs_to :group
  enum role: { admin: 0, moderator: 1, guest: 2 }
end
