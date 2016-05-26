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

require 'rails_helper'

RSpec.describe ChannelsController, type: :controller do
  describe 'block' do
    before do
      @user = User.find_from_auth(github_hash, nil)
      sign_in(@user)
      @other = create(:user, nickname: Faker::Internet.user_name)
    end

    it do
      expect {
        post :block, user: { nickname: @other.nickname }
      }.to change{@user.channel.blocks}.from([]).to([@other])
    end
  end

  describe 'unblock' do
    before do
      @user = User.find_from_auth(github_hash, nil)
      sign_in(@user)
      @other = create(:user, nickname: Faker::Internet.user_name)
      @user.channel.block(@other)
    end

    it do
      expect {
        post :unblock, user: { nickname: @other.nickname }
      }.to change{@user.channel.blocks}.from([@other]).to([])
    end
  end
end
