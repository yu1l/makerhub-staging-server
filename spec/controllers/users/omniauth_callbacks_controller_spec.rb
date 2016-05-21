require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :controller do
  before do
    request.env["devise.mapping"] = Devise.mappings[:user]
  end


  describe 'invalid' do
    before do
      OmniAuth.config.mock_auth[:github] = :invalid_credentials
      request.env['omniauth.auth'] = :invalid_credentials
    end

    context 'github' do
      describe 'sign up' do
        it do
          expect {
            post :github, provider: :github
          }.to change{User.count}.by(0)
          expect(User.count).to eq(0)
          expect(response).to redirect_to(new_user_session_path)
        end
      end

      describe 'sign in' do
        let(:user) { User.find_from_auth(github_hash, nil) }
        before do
          sign_in(user)
        end

        it do
          expect(User.count).to eq(1)
        end

        it do
          expect {
            post :github, provider: :github
          }.to change{User.count}.by(0)
          expect(response).to redirect_to(new_user_session_path)
        end
      end
    end
  end

  describe 'github' do
    before do
      request.env['omniauth.auth'] = OmniAuth.config.add_mock(:github, github_hash)
    end

    context 'sign in' do
      let(:user) { User.find_from_auth(github_hash, nil) }
      before do
        sign_in(user)
        post :github, provider: :github
      end

      it do
        expect(User.count).to eq(1)
      end

      it do
        expect {
          post :github, provider: :github
        }.to change{User.count}.by(0)
      end

      it do
        expect(response).to redirect_to(profile_path(name: user.name))
      end
    end

    context 'sign up' do
      before do
        expect(subject.current_user).to be_nil
        expect {
          post :github, provider: :github
        }.to change{User.count}.by(1)
        expect(User.count).to eq(1)
        @user = User.first
      end

      it do
        expect(@user).to be_valid
      end

      it do
        expect(@user.gh).to be_valid
      end

      it do
        expect(Gh.count).to eq(1)
      end

      it do
        expect(response).to redirect_to(profile_path(name: @user.name))
      end
    end
  end

  describe 'twitter' do
    before do
      request.env['omniauth.auth'] = OmniAuth.config.add_mock(:twitter, twitter_hash)
    end

    context 'integration' do
      before do
        @user = User.find_from_auth(OmniAuth.config.mock_auth[:github], nil)
        sign_in(@user)
      end

      it 'current_user' do
        expect(subject.current_user).not_to be_nil
      end

      it do
        expect(User.count).to eq(1)
      end

      context 'POST #twitter' do
        it do
          expect {
            post :twitter, provider: :twitter
          }.to change{Tw.count}.by(1)
        end
      end
    end
  end
end
