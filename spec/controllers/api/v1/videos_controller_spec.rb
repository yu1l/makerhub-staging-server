require 'rails_helper'

RSpec.shared_context 'invalid params' do
  it do
    expect(response.status).to eq(500)
  end
end

RSpec.shared_context 'valid params' do
  it do
    expect(response.status).to eq(200)
  end
end

RSpec.shared_context 'show user basic info' do
  it do
    expect(@sample['user']['name']).not_to be_nil
    expect(@sample['user']['nickname']).not_to be_nil
    expect(@sample['user']['avatar']).not_to be_nil
  end
end

RSpec.shared_context 'show video info' do
  it do
    expect(@sample['title']).not_to be_nil
    expect(@sample['play_url']).not_to be_nil
    expect(@sample['thumbnail']).not_to be_nil
    expect(@sample['duration']).not_to be_nil
    expect(@sample['pv']).not_to be_nil
    expect(@sample['category']).not_to be_nil
  end
end

RSpec.describe Api::V1::VideosController, type: :controller do
  let(:token) { double acceptable?: true }
  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  describe 'GET #all' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    let(:record) { create(:record) }
    before do
      user.records.create(attributes_for(:record))
      get :all, format: :json
      @sample = JSON.parse(response.body)['videos'][0]
    end

    it_behaves_like 'valid params'
    it_behaves_like 'show user basic info'
    it_behaves_like 'show video info'
  end

  describe 'GET #user' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    let(:record) { create(:record) }
    before do
      user.records.create(attributes_for(:record))
      get :user, nickname: user.nickname, format: :json
      @sample = JSON.parse(response.body)[0]
    end

    it_behaves_like 'valid params'
    it_behaves_like 'show user basic info'
    it_behaves_like 'show video info'
  end

  describe 'GET #video' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    let(:record) { create(:record) }
    before do
      user.records.create(attributes_for(:record))
      get :video, nickname: user.nickname, uuid: user.records.first.uuid, format: :json
      @sample = JSON.parse(response.body)
    end

    it_behaves_like 'valid params'
    it_behaves_like 'show user basic info'
    it_behaves_like 'show video info'
  end

  describe 'PATCH #update' do
    context 'via invalid params' do
      let(:user) { User.find_from_auth(github_hash, nil) }
      let(:record) { create(:record) }
      before do
        user.records.create(attributes_for(:record))
      end

      it do
        expect do
          patch :update, nickname: '', uuid: user.records.first.uuid, title: nil, current_user_nickname: user.nickname, format: :json
        end.not_to change { user.records.first.title }.from(attributes_for(:record)[:title])
        expect(response.status).to eq(500)
      end

      it do
        expect do
          patch :update, nickname: user.nickname, uuid: user.records.first.uuid, title: nil, current_user_nickname: user.nickname, format: :json
        end.not_to change { user.records.first.title }.from(attributes_for(:record)[:title])
        expect(response.status).to eq(500)
      end
    end

    context 'via user' do
      let(:user) { User.find_from_auth(github_hash, nil) }
      let(:record) { create(:record) }
      before do
        user.records.create(attributes_for(:record))
        expect do
          patch :update, nickname: user.nickname, uuid: user.records.first.uuid, title: 'hello world', current_user_nickname: user.nickname, format: :json
        end.to change { user.records.first.title }.from(attributes_for(:record)[:title]).to('hello world')
      end

      it_behaves_like 'valid params'
    end
  end

  describe 'PATCH #update - category' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    let(:record) { create(:record) }
    before do
      user.records.create(attributes_for(:record))
      expect do
        patch :update, nickname: user.nickname, uuid: user.records.first.uuid, category: 'Python', current_user_nickname: user.nickname, format: :json
      end.to change { user.records.first.category }.from(attributes_for(:record)[:category]).to(2)
    end

    it_behaves_like 'valid params'
  end
end
