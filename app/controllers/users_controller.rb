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
#  private_stream              :boolean
#  github                      :boolean
#  twitter                     :boolean
#  twitter_uid                 :string
#  github_uid                  :string
#

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:category]

  def stop_private_stream
    current_user.update(private_stream: false)
    @group = current_user.groups.find_by(uuid: params[:uuid])
    @group.update(streaming: false)
    redirect_to profile_path(name: current_user.name)
  end

  def private_stream
    current_user.update(private_stream: true)
    current_user.groups.map { |g| g.update(streaming: false) }
    @group = current_user.groups.find_by(uuid: params[:uuid])
    @group.update(streaming: true)
    redirect_to profile_path(name: current_user.name)
  end

  def follow
    @user = User.find_by(name: params[:name])
    authorize(@user, :other?)
    current_user.follow(@user) unless current_user.following?(@user)
    render nothing: true, status: 200
  rescue
    return render nothing: true, status: 500
  end

  def unfollow
    @user = User.find_by(name: params[:name])
    authorize(@user, :other?)
    current_user.stop_following(@user) if current_user.following?(@user)
    render nothing: true, status: 200
  rescue
    return render nothing: true, status: 500
  end

  def category
    @user = User.find_by(name: params[:name])
    authorize(@user, :me?)
    current_user.update(user_params)
    render js: :category, status: 200
  rescue
    render nothing: true, status: 500
  end

  def record_category
    current_user.records.find_by(uuid: params[:uuid]).update(record_params)
    redirect_to play_record_path(name: current_user.name, uuid: params[:uuid])
  end

  def profile
    @user = User.find_by(name: params[:name])
    authorize(@user, :me?)
    @me = true
    description = HTML::Pipeline::MarkdownFilter.new(@user.description)
    @content = description.call
  rescue
    return redirect_to stream_path(name: @user.name) unless @user.nil?
    redirect_to root_path
  end

  def update_description
    @user = User.find_by(name: params[:name])
    authorize(@user, :me?)
    current_user.update(user_params)
    description = HTML::Pipeline::MarkdownFilter.new(@user.description)
    @content = description.call
    render js: :update_description, status: 200
  rescue
    render nothing: true, status: 500
  end

  def update_title
    @user = User.find_by(name: params[:name])
    authorize(@user, :me?)
    current_user.update(user_params)
    render js: :update_title, status: 200
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

  private

  def user_params
    params.require(:user).permit(:name, :title, :description, :category)
  end

  def record_params
    params.require(:record).permit(:title, :category)
  end
end
