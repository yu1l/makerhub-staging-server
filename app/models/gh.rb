# == Schema Information
#
# Table name: ghs
#
#  id          :integer          not null, primary key
#  user_id     :integer
#  uid         :string
#  provider    :string
#  nickname    :string
#  email       :string
#  image       :string
#  blog_url    :string
#  profile_url :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  name        :string
#

class Gh < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
  validates :email, presence: true
  validates :image, presence: true
  # validates :name, presence: true
  # validates :nickname, presence: true
  # validates :profile_url, presence: true
end
