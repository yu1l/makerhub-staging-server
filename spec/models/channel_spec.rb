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

RSpec.describe Channel, type: :model do
  it { should belong_to(:user) }
  describe 'User has channel by default' do
    before { @user = User.find_from_auth(github_hash, nil) }
    it do
      expect(@user.channel).to be_valid
    end

    describe 'Channel is followable' do
      before do
        @other = create(:user)
        @other.follow(@user.channel)
      end

      it do
        expect(@user.channel.followers).to eq([@other])
        expect(@user).to be_valid
        expect(@other).to be_valid
      end

      describe 'User can block other for channel' do
        before do
          @user.channel.block(@other)
        end

        it do
          expect(@other.following?(@user.channel)).to be_falsy
          expect(@user.channel.followers).to eq([])
        end
      end
    end
  end
end
