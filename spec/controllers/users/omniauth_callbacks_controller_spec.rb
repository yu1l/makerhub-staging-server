require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
    request.env['omniauth.auth'] = mock_auth_hash
  end

  describe 'github' do
    it 'should be successful' do
      expect {
        post :github, provider: :github
      }.to change{User.count}.by(1)
    end
  end
end
