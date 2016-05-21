# == Schema Information
#
# Table name: tws
#
#  id                  :integer          not null, primary key
#  user_id             :integer
#  uid                 :string
#  provider            :string
#  access_token        :string
#  access_token_secret :string
#  description         :text
#  image               :string
#  location            :string
#  name                :string
#  nickname            :string
#  url                 :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#

class Tw < ActiveRecord::Base
  belongs_to :user
  validates :user_id, presence: true
  validates :provider, presence: true
  validates :uid, presence: true
end
