require 'rails_helper'

RSpec.describe Api::V1::VideosController, type: :controller do
  describe 'GET #all' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    let(:record) { create(:record) }
    before do
      user.records.create(attributes_for(:record))
      get :all, format: :json
      expect(response).to be_success
    end

    it do
      sample = JSON.parse(response.body)[0]
      expect(sample['title']).not_to be_nil
      expect(sample['video_url']).not_to be_nil
      expect(sample['thumbnail_url']).not_to be_nil
      expect(sample['duration']).not_to be_nil
      expect(sample['pv']).not_to be_nil
      expect(sample['category']).not_to be_nil
      expect(sample['user']['name']).not_to be_nil
      expect(sample['user']['nickname']).not_to be_nil
      expect(sample['user']['thumbnail']).not_to be_nil
    end
  end
end
