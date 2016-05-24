# == Schema Information
#
# Table nickname: groups
#
#  id         :integer          not null, primary key
#  name       :string
#  private    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  uuid       :string
#  streaming  :boolean
#

require 'rails_helper'

RSpec.describe GroupsController, type: :controller do
  describe 'POST #create' do
    context 'via anonymous' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @other = create(:user)
      end

      it do
        expect {
          post :create, nickname: @user.nickname, group: { name: 'test' }
        }.not_to change{@user.groups.count}.from(0)
        expect(@user.user_groups.count).to eq(0)
        expect(@user.user_groups.count).to eq(0)
        expect(response).to redirect_to(root_path)
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
          post :create, nickname: @user.nickname, group: { name: 'test' }
        }.not_to change{@user.groups.count}.from(0)
        expect(@user.user_groups.count).to eq(0)
        expect(@user.user_groups.count).to eq(0)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'via current_user' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        sign_in(@user)
      end

      it do
        expect {
          post :create, nickname: subject.current_user.nickname, group: { name: 'test' }
        }.to change{subject.current_user.groups.count}.from(0).to(1)
        expect(subject.current_user.user_groups.count).to eq(1)
        expect(subject.current_user.user_groups.last.admin?).to be_truthy
        expect(response).to redirect_to(profile_path(nickname: subject.current_user.nickname))
      end
    end
  end
  describe 'GET #invite' do
    context 'via anonymous' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @group = @user.groups.create(name: 'test')
        @other = create(:user)
        post :create, nickname: @user.nickname, group: { name: 'test' }
      end
      it do
        expect {
          get :invite, uuid: @user.groups.last.uuid, user_uuid: @user.uuid
        }.not_to change{@user.groups.last.users.count}.from(1)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'via other' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @group = @user.groups.create(name: 'test')
        @other = create(:user)
        sign_in(@other)
      end

      it do
        expect {
          get :invite, uuid: @user.groups.last.uuid, user_uuid: @user.uuid
        }.not_to change{@user.groups.last.users.count}.from(1)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'via current_user' do
      before do
        @user = User.find_from_auth(github_hash, nil)
        @other = create(:user)
        sign_in(@user)
        post :create, nickname: subject.current_user.nickname, group: { name: 'test' }
        @group = @user.groups.last
      end

      it do
        expect {
          get :invite, uuid: subject.current_user.groups.last.uuid, user_uuid: @other.uuid
        }.to change{subject.current_user.groups.last.users.count}.from(1).to(2)
      end

      it do
        get :invite, uuid: subject.current_user.groups.last.uuid, user_uuid: @other.uuid
        expect(@other.user_groups.last.guest?).to be_truthy
      end

      it do
        expect {
          get :invite, uuid: subject.current_user.groups.last.uuid, user_uuid: @other.uuid
        }.to change{@other.groups.count}.from(0).to(1)
      end

      after do
        expect(response).to redirect_to(profile_path(nickname: @user.nickname))
      end
    end
  end
end
