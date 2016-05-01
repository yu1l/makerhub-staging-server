# == Schema Information
#
# Table name: users
#
#  id                          :integer          not null, primary key
#  email                       :string           default(""), not null
#  encrypted_password          :string           default(""), not null
#  reset_password_token        :string
#  reset_password_sent_at      :datetime
#  remember_created_at         :datetime
#  sign_in_count               :integer          default(0), not null
#  current_sign_in_at          :datetime
#  last_sign_in_at             :datetime
#  current_sign_in_ip          :string
#  last_sign_in_ip             :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  uuid                        :string
#  provider                    :string
#  uid                         :string
#  name                        :string
#  twitter_access_token        :string
#  twitter_access_token_secret :string
#  twitter_nickname            :string
#  twitter_image_url           :string
#  twitter_name                :string
#  twitter_url                 :string
#  twitter_description         :string
#  twitter_location            :string
#  streaming_key               :string
#  title                       :string
#  live                        :boolean          default(FALSE)
#  description                 :text
#  total                       :integer
#

class UsersController < ApplicationController
  def profile
    @user = User.find_by(name: params[:name])
    description = HTML::Pipeline::MarkdownFilter.new(@user.description)
    @content = description.call
  end

  def update_description
    @user = User.find_by(name: params[:name])
    if @user.update(user_params)
      description = HTML::Pipeline::MarkdownFilter.new(@user.description)
      @content = description.call
      render :update_description
    end
  end

  def update_title
    @user = User.find_by(name: params[:name])
    if @user.update(user_params)
      render :update_title
    end
  end

  def update_record_title
    @user = User.find_by(name: params[:name])
    @record = @user.records.find_by(uuid: params[:uuid])
    if @record.update(record_params)
      render :update_record_title
    end
  end

  def stream
    @user = User.find_by(name: params[:name])
  end

  private

  def user_params
    params.require(:user).permit(:name, :title, :description)
  end

  def record_params
    params.require(:record).permit(:title)
  end
end
