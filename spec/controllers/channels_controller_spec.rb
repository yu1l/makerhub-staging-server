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
  before do
    @user = User.find_from_auth(github_hash, nil)
    sign_in(@user)
    @other = create(:user, nickname: Faker::Internet.user_name)
  end

  describe 'POST #block' do
    context 'valid params' do
      it { expect { post :block, user: { nickname: @other.nickname } }.to change { @user.channel.blocks }.from([]).to([@other]) }
    end

    context 'invalid params' do
      it { expect { post :block, user: { nickname: '' } }.not_to change { @user.channel.blocks }.from([]) }
    end

    context 'user can not block himself' do
      it { expect { post :block, user: { nickname: @user.nickname } }.not_to change { @user.channel.blocks }.from([]) }
    end
  end

  describe 'unblock' do
    before do
      @user.channel.block(@other)
    end

    context 'valid params' do
      it { expect { post :unblock, user: { nickname: @other.nickname } }.to change { @user.channel.blocks }.from([@other]).to([]) }
    end

    context 'invalid params' do
      it { expect { post :unblock, user: { nickname: '' } }.not_to change { @user.channel.blocks }.from([@other]) }
    end

    context 'user can not unblock himself' do
      it { expect { post :unblock, user: { nickname: @user.nickname } }.not_to change { @user.channel.blocks }.from([@other]) }
    end
  end
end
