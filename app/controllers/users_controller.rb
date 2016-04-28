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
#  uuid                   :string
#  provider               :string
#  uid                    :string
#  name                   :string
#  twitter_nickname       :string
#  twitter_image_url      :string
#  twitter_name           :string
#  twitter_url            :string
#  twitter_description    :string
#  twitter_location       :string
#  streaming_key          :string
#  title                  :string           default("Anonymous Title")
#  live                   :boolean          default(FALSE)
#  description            :text             default("Anonymous Description")
#

class UsersController < ApplicationController
  def profile
    @user = User.find_by(name: params[:name])
  end

  def stream
    @user = User.find_by(name: params[:name])
  end
end
