require "rails_helper"

RSpec.describe "routes for API", :type => :routing do
  describe 'Videos' do
    it 'GET /' do
      expect(get("/api/v1/videos")).to route_to(controller: 'api/v1/videos', action: 'all')
      expect(get("/api/v1/videos/")).to route_to(controller: 'api/v1/videos', action: 'all')
    end

    it 'GET /:nickname' do
      expect(get('/api/v1/videos/dummy')).to route_to(controller: 'api/v1/videos', action: 'user', nickname: 'dummy')
    end

    it 'GET /:nickname/:uuid' do
      expect(get('/api/v1/videos/dummy/abcd')).to route_to(controller: 'api/v1/videos', action: 'video', nickname: 'dummy', uuid: 'abcd')
    end

    it 'patch /:nickname/:uuid/title' do
      # expect(patch('/api/v1/videos/dummy/abcd/title')).to route_to(controller: 'api/v1/videos', action: 'update', nickname: 'dummy', uuid: 'abcd')
    end

    it 'patch /:nickname/:uuid/category' do
      # expect(patch('/api/v1/videos/dummy/abcd/category')).to route_to(controller: 'api/v1/videos', action: 'update', nickname: 'dummy', uuid: 'abcd')
    end
  end
end
