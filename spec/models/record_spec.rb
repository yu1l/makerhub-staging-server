# == Schema Information
#
# Table name: records
#
#  id              :integer          not null, primary key
#  video_path      :string
#  screenshot_path :string
#  uuid            :string
#  uploaded        :boolean
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  title           :string
#  duration        :float
#  total           :integer
#  category        :integer
#  private         :boolean
#  group_id        :integer
#

require 'rails_helper'

RSpec.describe Record, type: :model do
  it { should validate_presence_of(:user_id) }
  it { should belong_to(:user) }
  it { should belong_to(:group) }
  describe '#screenshot_url' do
    context 'when not uploaded' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @record = @user.records.create(uploaded: false)
      end

      it do
        expect(@record.screenshot_url).to eq("/#{@record.uuid}.png")
      end
    end

    context 'when uploaded' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @record = @user.records.create(uploaded: true, screenshot_path: 'somewhere')
      end

      it do
        expect(@record.screenshot_url).to eq("https://live-streaming-staging.s3-ap-northeast-1.amazonaws.com/#{@record.screenshot_path}")
      end
    end
  end
  describe '#video_url' do
    context 'when not uploaded' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @record = @user.records.create(uploaded: false)
      end

      it do
        expect(@record.video_url).to eq("/#{@record.uuid}.mp4")
      end
    end

    context 'when uploaded' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @record = @user.records.create(uploaded: true, video_path: 'somewhere')
      end

      it do
        expect(@record.video_url).to eq("https://live-streaming-staging.s3-ap-northeast-1.amazonaws.com/#{@record.video_path}")
      end
    end
  end
  describe '#copy_screenshot_to_tmp'
  describe '#copy_video_to_tmp'
  describe '#upload_to_s3'
end
