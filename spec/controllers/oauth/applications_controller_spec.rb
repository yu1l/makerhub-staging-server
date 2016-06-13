require 'rails_helper'

RSpec.describe Oauth::ApplicationsController, type: :controller do
  describe 'GET #index' do
    before do
      @user = User.find_from_auth(github_hash, nil)
      @user.admin!
      @user.oauth_applications.create(attributes_for(:application))
      sign_in(@user)
      get :index
    end

    it do
      expect(assigns(:applications)).to eq(@user.oauth_applications)
    end
  end

  describe 'POST #create - invalid' do
    before do
      @user = User.find_from_auth(github_hash, nil)
      @user.admin!
      sign_in(@user)
      expect do
        post :create, doorkeeper_application: { name: '', redirect_uri: 'http://app.com/callback', scopes: '' }
      end.not_to change { @user.oauth_applications.count }.from(0)
    end

    it do
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    before do
      @user = User.find_from_auth(github_hash, nil)
      @user.admin!
      sign_in(@user)
      expect do
        post :create, doorkeeper_application: { name: 'test', redirect_uri: 'http://app.com/callback', scopes: '' }
      end.to change { @user.oauth_applications.count }.from(0).to(1)
    end

    it do
      @application = Doorkeeper::Application.last
      expect(@application.owner).to eq(@user)
      expect(response).to redirect_to(oauth_application_url(@application))
    end
  end
end
