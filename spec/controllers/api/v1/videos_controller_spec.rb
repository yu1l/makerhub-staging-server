require 'rails_helper'

RSpec.describe Api::V1::VideosController, type: :controller do
  let(:token) { double acceptable?: true }
  before do
    allow(controller).to receive(:doorkeeper_token) {token}
  end

  describe 'GET #all' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    let(:record) { create(:record) }
    before do
      user.records.create(attributes_for(:record))
      get :all, format: :json
      expect(response).to be_success
    end

    it do
      sample = JSON.parse(response.body)['videos'][0]
      expect(sample['title']).not_to be_nil
      expect(sample['play_url']).not_to be_nil
      expect(sample['thumbnail']).not_to be_nil
      expect(sample['duration']).not_to be_nil
      expect(sample['pv']).not_to be_nil
      expect(sample['category']).not_to be_nil
      expect(sample['user']['name']).not_to be_nil
      expect(sample['user']['nickname']).not_to be_nil
      expect(sample['user']['avatar']).not_to be_nil
    end
  end

  describe 'GET #user' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    let(:record) { create(:record) }
    before do
      user.records.create(attributes_for(:record))
      get :user, nickname: user.nickname, format: :json
      expect(response).to be_success
    end

    it do
      sample = JSON.parse(response.body)[0]
      expect(sample['title']).not_to be_nil
      expect(sample['play_url']).not_to be_nil
      expect(sample['thumbnail']).not_to be_nil
      expect(sample['duration']).not_to be_nil
      expect(sample['pv']).not_to be_nil
      expect(sample['category']).not_to be_nil
      expect(sample['user']['name']).to eq(user.name)
      expect(sample['user']['nickname']).to eq(user.nickname)
      expect(sample['user']['avatar']).to eq(user.gh.image)
    end
  end

  describe 'GET #video' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    let(:record) { create(:record) }
    before do
      user.records.create(attributes_for(:record))
      get :video, nickname: user.nickname, uuid: user.records.first.uuid, format: :json
      expect(response).to be_success
    end

    it do
      sample = JSON.parse(response.body)
      expect(sample['title']).not_to be_nil
      expect(sample['play_url']).not_to be_nil
      expect(sample['thumbnail']).not_to be_nil
      expect(sample['duration']).not_to be_nil
      expect(sample['pv']).not_to be_nil
      expect(sample['category']).not_to be_nil
      expect(sample['user']['name']).to eq(user.name)
      expect(sample['user']['nickname']).to eq(user.nickname)
      expect(sample['user']['avatar']).to eq(user.gh.image)
    end
  end

  describe 'PATCH #update' do
    context 'via invalid params' do
      let(:user) { User.find_from_auth(github_hash, nil) }
      let(:record) { create(:record) }
      before do
        user.records.create(attributes_for(:record))
      end

      it do
        expect {
          patch :update, nickname: '', uuid: user.records.first.uuid, title: nil, current_user_nickname: user.nickname, format: :json
        }.not_to change{user.records.first.title}.from(attributes_for(:record)[:title])
        expect {
          patch :update, nickname: user.nickname, uuid: user.records.first.uuid, title: nil, current_user_nickname: user.nickname, format: :json
        }.not_to change{user.records.first.title}.from(attributes_for(:record)[:title])
        expect(response.status).to eq(500)
      end
    end

    context 'via user' do
      let(:user) { User.find_from_auth(github_hash, nil) }
      let(:record) { create(:record) }
      before do
        user.records.create(attributes_for(:record))
      end

      it do
        expect {
          patch :update, nickname: user.nickname, uuid: user.records.first.uuid, title: 'hello world', current_user_nickname: user.nickname, format: :json
        }.to change{user.records.first.title}.from(attributes_for(:record)[:title]).to('hello world')
        expect(response).to be_success
      end
    end
  end

  describe 'PATCH #update - category' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    let(:record) { create(:record) }
    before do
      user.records.create(attributes_for(:record))
    end

    it do
      expect {
        patch :update, nickname: user.nickname, uuid: user.records.first.uuid, category: 'Python', current_user_nickname: user.nickname, format: :json
      }.to change{user.records.first.category}.from(attributes_for(:record)[:category]).to(2)
      expect(response).to be_success
    end
  end
end
