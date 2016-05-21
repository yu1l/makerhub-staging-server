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
  describe 'POST #update_description' do
    context 'via anonymous' do
      before do
        @user = User.find_from_auth(github_hash, nil)
      end

      it do
        expect {
          post :update_description, name: @user.name, user: { description: '# Heading' }
        }.not_to change{@user.description}.from(I18n.t('user.default.description'))
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
          post :update_description, name: @user.name, user: { description: '# Heading' }
        }.not_to change{@user.description}.from(I18n.t('user.default.description'))
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
          post :update_description, name: subject.current_user.name, user: { description: '# Heading' }
        }.to change{subject.current_user.description}.from(I18n.t('user.default.description')).to('# Heading')
        expect(response.status).to eq(200)
      end
    end
  end

  describe 'POST #update_title' do
    context 'via anonymous' do
      before do
        @user = User.find_from_auth(github_hash, nil)
      end

      it do
        expect {
          post :update_title, name: @user.name, user: { title: 'new title' }
        }.not_to change{@user.title}.from(I18n.t('user.default.title'))
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
          post :update_title, name: @user.name, user: { title: 'new title' }
        }.not_to change{@user.title}.from(I18n.t('user.default.title'))
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
          post :update_title, name: subject.current_user.name, user: { title: 'new title' }
        }.to change{subject.current_user.title}.from(I18n.t('user.default.title')).to('new title')
        expect(response.status).to eq(200)
      end
    end
  end

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

  describe 'GET #private_stream' do
    context 'via anonymous' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @group = @user.groups.create(name: 'test')
        @user.user_groups.find_by(group_id: @group.id).admin!
      end

      it do
        expect {
          get :private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.attributes}

        expect {
          get :private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.user_groups.map(&:attributes)}

        expect {
          get :private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.groups.map(&:attributes)}

        expect(response).to redirect_to(root_path)
      end
    end

    context 'via other' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @other = create(:user)
        sign_in(@other)
        @group = @user.groups.create(name: 'test')
        @user.user_groups.find_by(group_id: @group.id).admin!
      end

      it do
        expect {
          get :private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.attributes}

        expect {
          get :private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.user_groups.map(&:attributes)}

        expect {
          get :private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.groups.map(&:attributes)}

        expect(response).to redirect_to(root_path)
      end
    end

    context 'via current_user' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        sign_in(@user)
        @group = @user.groups.create(name: 'test')
        @group1 = @user.groups.create(name: 'other')
        @group1.update(streaming: true)
        @user.user_groups.find_by(group_id: @group1.id).admin!
        @user.user_groups.find_by(group_id: @group.id).admin!
        get :private_stream, name: subject.current_user.name, uuid: @group.uuid
      end

      it do
        expect(subject.current_user.private_stream).to be_truthy
        expect(subject.current_user.groups.find_by(uuid: @group.uuid).user_groups.first.admin?).to be_truthy
        expect(subject.current_user.groups.find_by(uuid: @group.uuid).streaming).to be_truthy
        expect(subject.current_user.groups.find_by(uuid: @group1.uuid).streaming).to be_falsy
        expect(subject.current_user.groups.where(streaming: true).count).to eq(1)
        expect(response).to redirect_to(profile_path(name: subject.current_user.name))
      end
    end
  end

  describe 'GET #stop_private_stream' do
    context 'via anonymous' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @other = create(:user)
        @user.update(private_stream: true)
        @group = @user.groups.create(name: 'test')
        @user.user_groups.find_by(group_id: @group.id).admin!
      end

      it do
        expect {
          get :stop_private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.attributes}

        expect {
          get :stop_private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.user_groups.map(&:attributes)}

        expect {
          get :stop_private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.groups.map(&:attributes)}

        expect(response).to redirect_to(root_path)
      end
    end

    context 'via other' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @other = create(:user)
        @user.update(private_stream: true)
        sign_in(@other)
        @group = @user.groups.create(name: 'test')
        @user.user_groups.find_by(group_id: @group.id).admin!
      end

      it do
        expect {
          get :stop_private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.attributes}

        expect {
          get :stop_private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.user_groups.map(&:attributes)}

        expect {
          get :stop_private_stream, name: @user.name, uuid: @group.uuid
        }.not_to change{@user.groups.map(&:attributes)}

        expect(response).to redirect_to(root_path)
      end
    end

    context 'via current_user' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        sign_in(@user)
        @user.update(private_stream: true)
        @group = @user.groups.create(name: 'test')
        @group.update(streaming: true)
        @user.user_groups.find_by(group_id: @group.id).admin!
        get :stop_private_stream, name: subject.current_user.name, uuid: @group.uuid
      end

      it do
        expect(subject.current_user.private_stream).to be_falsy
        expect(subject.current_user.groups.find_by(uuid: @group.uuid).user_groups.first.admin?).to be_truthy
        expect(subject.current_user.groups.find_by(uuid: @group.uuid).streaming).to be_falsy
        expect(subject.current_user.groups.where(streaming: true).count).to eq(0)
        expect(response).to redirect_to(profile_path(name: subject.current_user.name))
      end
    end
  end
  describe 'POST #record_cateogry'
  describe 'POST #update_record_title'
end
