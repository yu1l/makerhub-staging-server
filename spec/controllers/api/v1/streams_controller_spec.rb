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

RSpec.shared_context 'show stream detail info' do
  it do
    expect(@sample['title']).not_to be_nil
    expect(@sample['summary']).not_to be_nil
    expect(@sample['viewers']).not_to be_nil
    expect(@sample['category']).not_to be_nil
  end
end

RSpec.describe Api::V1::StreamsController, type: :controller do
  let(:token) { double acceptable?: true }
  before do
    allow(controller).to receive(:doorkeeper_token) { token }
  end

  describe 'GET #all' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    before do
      user.update(live: true)
      get :all, format: :json
      @sample = JSON.parse(response.body)['streams'][0]
    end

    it_behaves_like 'valid params'
    it_behaves_like 'show stream detail info', @sample
    it_behaves_like 'show user basic info',    @sample
    it do
      expect(@sample['thumbnail']).not_to be_nil
    end
  end

  describe 'GET #user' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    before do
      user.update(live: true)
      get :user, nickname: user.gh.nickname, format: :json
      @sample = JSON.parse(response.body)
    end

    it_behaves_like 'valid params'
    it_behaves_like 'show stream detail info', @sample
    it_behaves_like 'show user basic info', @sample
  end

  describe 'PATCH #update - title' do
    context 'via anonymous or other' do
      let(:user) { User.find_from_auth(github_hash, nil) }
      before do
        @other = create(:user)
        @user = user
        @user.update(title: 'before')
        patch :update, nickname: @user.gh.nickname, current_user_nickname: @other.nickname, title: 'after', format: :json
        patch :update, nickname: @user.gh.nickname, current_user_nickname: @user.gh.nickname, title: nil, format: :json
        @user.reload
      end

      it_behaves_like 'invalid params'
      it do
        expect(@user.title).to eq('before')
      end
    end

    context 'invalid params' do
      let(:user) { User.find_from_auth(github_hash, nil) }
      before do
        patch :update, nickname: '', current_user_nickname: '', title: 'after', format: :json
      end

      it_behaves_like 'invalid params'
    end

    context 'via user' do
      let(:user) { User.find_from_auth(github_hash, nil) }
      before do
        @user = user
        @user.update(title: 'before')
        patch :update, nickname: @user.gh.nickname, current_user_nickname: @user.gh.nickname, title: 'after', format: :json
        @user.reload
      end

      it_behaves_like 'valid params'
      it do
        expect(@user.title).to eq('after')
      end
    end
  end

  describe 'GET #comments' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    before do
      user.chats.create(text: 'hello world', sender: user.gh.nickname)
      get :comments, nickname: user.gh.nickname, format: :json
      parsed_response = JSON.parse(response.body)
      @sample = parsed_response['comments'][0]
    end

    it_behaves_like 'valid params'
    it_behaves_like 'show user basic info', @sample
    it do
      expect(@sample['text']).not_to be_nil
    end
  end

  skip describe 'POST #create_comment' do
  end

  skip describe 'GET #block_list' do
  end

  skip describe 'POST #block' do
  end

  skip describe 'POST #unblock' do
  end
end
