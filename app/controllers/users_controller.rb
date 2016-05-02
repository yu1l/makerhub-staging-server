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
#  category                    :integer
#

class UsersController < ApplicationController
  def category
    current_user.update(user_params)
    render :category
#    redirect_to profile_path(name: current_user.name)
  end

  def record_category
    current_user.records.find_by(uuid: params[:uuid]).update(record_params)
    redirect_to play_record_path(name: current_user.name, uuid: params[:uuid])
  end

  def profile
    @user = User.find_by(name: params[:name])
    @me = true if @user == current_user
    description = HTML::Pipeline::MarkdownFilter.new(@user.description)
    @content = description.call
  rescue
    redirect_to root_path
  end

  def update_description
    @user = User.find_by(name: params[:name])
    if @user.update(user_params)
      @user.reload
      description = HTML::Pipeline::MarkdownFilter.new(@user.description)
      @content = description.call
      render :update_description
    end
  rescue
    render nothing: true, status: 500
  end

  def update_title
    @user = User.find_by(name: params[:name])
    if @user.update(user_params)
      render :update_title
    end
  rescue
    render nothing: true, status: 500
  end

  def update_record_title
    @user = User.find_by(name: params[:name])
    @record = @user.records.find_by(uuid: params[:uuid])
    if @record.update(record_params)
      render :update_record_title
    end
  rescue
    render nothing: true, status: 500
  end

  def stream
    @user = User.find_by(name: params[:name])
  rescue
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :title, :description, :category)
  end

  def record_params
    params.require(:record).permit(:title, :category)
  end
end
