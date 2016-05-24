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

RSpec.describe RecordsController, type: :controller do
  describe 'GET #play' do
    context 'invalid' do
      context 'record does not exist' do
        before do
          @user = User.find_from_auth(github_hash, nil)
          @record = @user.records.create(title: @user.title, total: @user.total)
        end

        it do
          get :play, nickname: @user.nickname, uuid: ''
          expect(response).to redirect_to(stream_path(nickname: @user.nickname))
        end
      end

      context 'user does not exist' do
        before do
          @user = User.find_from_auth(github_hash, nil)
          @record = @user.records.create(title: @user.title, total: @user.total)
        end

        it do
          get :play, nickname: '', uuid: @record.uuid
          expect(response).to redirect_to(root_path)
        end
      end
    end
    context 'valid' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @record = @user.records.create(title: @user.title, total: @user.total)
      end

      it do
        get :play, nickname: @user.nickname, uuid: @record.uuid
        expect(response).to render_template(:play)
      end
    end
  end
end
