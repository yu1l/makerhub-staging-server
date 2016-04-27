# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

# User
class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  def self.find_or_create_from_twitter(auth)
    provider = auth[:provider]
    uid = auth[:uid]
    nickname = auth[:info][:nickname]
    image_url = auth[:info][:image]
    name = auth[:info][:name]
    location = auth[:info][:location]
    description = auth[:info][:description]
    twitter_url = auth[:info][:Twitter]

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.email = "#{Devise.friendly_token(8)}@design_and_develop.com"
      pass = Devise.friendly_token(8)
      user.password = pass
      user.password_confirmation = pass
      user.nickname = nickname
      user.image_url = image_url
      user.name = name
      user.twitter_url = twitter_url
      user.description = description
      user.location = location
    end
  end
end
