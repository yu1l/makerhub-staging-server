require 'rails_helper'

RSpec.describe Api::V1::StreamsController, type: :controller do
  describe 'GET #all' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    before do
      user.update(live: true)
      get :all, format: :json
      expect(response).to be_success
    end

    it do
      parsed_response = JSON.parse(response.body)['streams']
      sample = parsed_response[0]
      expect(sample['title']).not_to be_nil
      expect(sample['thumbnail']).not_to be_nil
      expect(sample['summary']).not_to be_nil
      expect(sample['viewers']).not_to be_nil
      expect(sample['category']).not_to be_nil
      expect(sample['user']['name']).not_to be_nil
      expect(sample['user']['nickname']).not_to be_nil
      expect(sample['user']['avatar']).not_to be_nil
    end
  end

  describe 'GET #user' do

  end

  describe 'PATCH #update - title' do

  end

  describe 'GET #comments' do

  end

  describe 'POST #comments' do

  end

  describe 'GET #block_list' do

  end

  describe 'POST #block' do

  end

  describe 'POST #unblock' do

  end
end
