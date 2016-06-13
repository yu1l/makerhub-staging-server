require 'rails_helper'

RSpec.describe ApplicationHelper, type: :helper do
  describe 'stream_url - production' do
    before do
      Rails.env = 'production'
    end

    it do
      expect(stream_url).to eq('makerhub.live')
    end
  end

  describe 'stream_url' do
    before do
      Rails.env = 'development'
    end

    it do
      expect(stream_url).to eq('192.168.179.2')
    end
  end

  describe 'category' do
    it do
      expect(category(0)).to eq('UI/UX')
      expect(category(1)).to eq('Ruby')
      expect(category(2)).to eq('Python')
    end
  end

  describe 'app_title' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    it do
      expect(app_title(name: nil)).to eq(I18n.t('app.title'))
      expect(app_title(name: user.name)).to eq("#{I18n.t('app.title')} - #{user.name}")
    end
  end

  describe 'time' do
    let(:long) { 3600 }
    let(:middle) { 600 }
    let(:short) { 6 }
    it do
      expect(time(short)).to eq("6 #{I18n.t('time.sec')}")
      expect(time(middle)).to eq("10 #{I18n.t('time.min')} 0 #{I18n.t('time.sec')}")
      expect(time(long)).to eq("1 #{I18n.t('time.hour')} 0 #{I18n.t('time.min')} 0 #{I18n.t('time.sec')}")
    end
  end
end
