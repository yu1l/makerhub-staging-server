# == Schema Information
#
# Table name: users
#
#  id                          :integer          not null, primary key
#  email                       :string           default(""), not null
#  encrypted_password          :string           default(""), not null
#  reset_password_token        :string
#  reset_password_sent_at      :datetime
#  remember_created_at         :datetime
#  sign_in_count               :integer          default(0), not null
#  current_sign_in_at          :datetime
#  last_sign_in_at             :datetime
#  current_sign_in_ip          :string
#  last_sign_in_ip             :string
#  created_at                  :datetime         not null
#  updated_at                  :datetime         not null
#  uuid                        :string
#  provider                    :string
#  uid                         :string
#  name                        :string
#  twitter_access_token        :string
#  twitter_access_token_secret :string
#  twitter_nickname            :string
#  twitter_image_url           :string
#  twitter_name                :string
#  twitter_url                 :string
#  twitter_description         :string
#  twitter_location            :string
#  streaming_key               :string
#  title                       :string
#  live                        :boolean          default(FALSE)
#  description                 :text
#  total                       :integer
#  category                    :integer
#  private_stream              :boolean
#  github                      :boolean
#  twitter                     :boolean
#  twitter_uid                 :string
#  github_uid                  :string
#

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  describe 'POST #update_description'
  describe 'POST #update_title'
  describe 'POST #update_record_title'

  describe 'POST #category' do
    context 'via anonymous' do
      before do
        @user = User.find_from_auth(github_hash, nil)
      end

      it do
        expect {
          post :category, name: @user.name, user: { category: 2 }
        }.not_to change{@user.category}.from(0)
        expect(response.status).to eq(500)
      end
    end

    context 'via other' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @other = create(:user)
        sign_in(@other)
      end

      it do
        expect {
          post :category, name: @user.name, user: { category: 2 }
        }.not_to change{@user.category}.from(0)
        expect(response.status).to eq(500)
      end
    end

    context 'via current_user' do
      let(:user) { User.find_from_auth(github_hash, nil) }
      before do
        sign_in(user)
      end

      it do
        expect {
          post :category, name: subject.current_user.name, user: { category: 2 }
        }.to change{subject.current_user.category}.from(0).to(2)
        expect(response).to be_success
      end
    end
  end

  describe 'GET #private_stream'
  describe 'GET #stop_private_stream'
  describe 'POST #record_cateogry'

  describe 'GET #profile' do
    before do
      @user = User.find_from_auth(github_hash, nil)
    end

    context 'anonymous' do
      context 'with invalid params' do
        before do
          get :profile, name: ''
        end

        it do
          expect(subject.current_user).to be_nil
          expect(response).to redirect_to(root_path)
        end
      end

      context 'with valid params' do
        before do
          get :profile, name: @user.name
        end

        it do
          expect(subject.current_user).to be_nil
          expect(response).to redirect_to(stream_path(name: @user.name))
        end
      end
    end

    context 'another user' do
      let(:other) { create(:user) }
      before do
        sign_in(other)
        get :profile, name: @user.name
      end

      it do
        expect(other).to be_valid
        expect(subject.current_user).not_to be_nil
        expect(response).to redirect_to(stream_path(name: @user.name))
      end
    end

    context 'current_user' do
      before do
        sign_in(@user)
        get :profile, name: @user.name
      end

      it do
        expect(subject.current_user).not_to be_nil
      end

      it do
        expect(assigns(:me)).to be_truthy
      end

      it do
        expect(assigns(:content)).to eq("<p>#{I18n.t('user.default.description')}</p>")
      end

      it do
        expect(response).to render_template(:profile)
      end
    end
  end

  describe 'GET #follow' do
    context 'via anonymous user' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        get :follow, name: @user.name
      end

      it 'status 500' do
        expect(@user.all_following.count).to eq(0)
        expect(@user.followers.count).to eq(0)
        expect(response.status).to eq(500)
      end
    end

    context 'via signed in user' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @other = create(:user)
        sign_in(@other)
        get :follow, name: @user.name
      end

      it 'status 200' do
        expect(@other.all_following.first).to eq(@user)
        expect(@other.all_following.count).to eq(1)
        expect(@other.followers.count).to eq(0)
        expect(@user.followers.first).to eq(@other)
        expect(@user.all_following.count).to eq(0)
        expect(@user.followers.count).to eq(1)
        expect(response.status).to eq(200)
      end
    end

    context 'via current_user' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        sign_in(@user)
        get :follow, name: @user.name
      end

      it 'status 500' do
        expect(@user.all_following.count).to eq(0)
        expect(@user.followers.count).to eq(0)
        expect(response.status).to eq(500)
      end
    end
  end

  describe 'GET #unfollow' do
    context 'via anonymous user' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        get :unfollow, name: @user.name
      end

      it 'status 500' do
        expect(@user.all_following.count).to eq(0)
        expect(@user.followers.count).to eq(0)
        expect(response.status).to eq(500)
      end
    end

    context 'via signed in user' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @other = create(:user)
        sign_in(@other)
        get :follow, name: @user.name
        get :unfollow, name: @user.name
      end

      it 'status 200' do
        expect(@other.all_following.count).to eq(0)
        expect(@other.followers.count).to eq(0)
        expect(@user.all_following.count).to eq(0)
        expect(@user.followers.count).to eq(0)
        expect(response.status).to eq(200)
      end
    end

    context 'via current_user' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        sign_in(@user)
        get :unfollow, name: @user.name
      end

      it 'status 500' do
        expect(@user.all_following.count).to eq(0)
        expect(@user.followers.count).to eq(0)
        expect(response.status).to eq(500)
      end
    end
  end
end
