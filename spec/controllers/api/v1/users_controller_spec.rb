require 'rails_helper'

RSpec.describe Api::V1::UsersController, type: :controller do
  describe 'GET #followings' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    before do
      @other = User.create(email: 'other@sample.com',
                           password: 'password',
                           password_confirmation: 'password',
                           nickname: 'other',
                           name: 'other person')
      @other.add_github_info('uid' => '12345',
                             'info' => {
                               'email' => 'other@corp.com',
                               'image' => 'other.png',
                               'name' => 'other',
                               'nickname' => 'other_p',
                               'urls' => {
                                 'GitHub' => 'https://github.com/other_p',
                                 'Blog' => ''
                               }})
      @user = user
      @user.follow(@other)
      get :followings, nickname: @user.gh.nickname, format: :json
      expect(response).to be_success
    end

    it do
      parsed_response = JSON.parse(response.body)
      sample = parsed_response['followings'][0]
      expect(sample['name']).not_to be_nil
      expect(sample['nickname']).not_to be_nil
      expect(sample['avatar']).not_to be_nil
    end
  end

  describe 'GET #followers' do
    let(:user) { User.find_from_auth(github_hash, nil) }
    before do
      @other = User.create(email: 'other@sample.com',
                           password: 'password',
                           password_confirmation: 'password',
                           nickname: 'other',
                           name: 'other person')
      @other.add_github_info('uid' => '12345',
                             'info' => {
                               'email' => 'other@corp.com',
                               'image' => 'other.png',
                               'name' => 'other',
                               'nickname' => 'other_p',
                               'urls' => {
                                 'GitHub' => 'https://github.com/other_p',
                                 'Blog' => ''
                               }})
      @user = user
      @other.follow(@user)
      get :followers, nickname: @user.gh.nickname, format: :json
      expect(response).to be_success
    end

    it do
      parsed_response = JSON.parse(response.body)
      sample = parsed_response['followers'][0]
      expect(sample['name']).not_to be_nil
      expect(sample['nickname']).not_to be_nil
      expect(sample['avatar']).not_to be_nil
    end
  end
end
