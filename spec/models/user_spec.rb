# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string
#  last_sign_in_ip        :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  uuid                   :string
#  name                   :string
#  streaming_key          :string
#  title                  :string
#  live                   :boolean          default(FALSE)
#  description            :text
#  total                  :integer
#  category               :integer
#  github                 :boolean
#  twitter_uid            :string
#  github_uid             :string
#  private                :boolean
#  twitter                :boolean
#  nickname               :string
#  role                   :integer          default(0)
#

require 'rails_helper'

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should have_one(:gh) }
  it { should have_one(:channel) }

  describe '.before_create' do
    let(:resource) { create(:user) }
    subject { resource }
    it { is_expected.to be_valid }
    it 'set default values' do
      expect(resource.uuid).not_to be_nil
      expect(resource.streaming_key).not_to be_nil
      expect(resource.title).to eq(I18n.t('user.default.title'))
      expect(resource.description).to eq(I18n.t('user.default.description'))
      expect(resource.private).to be_falsy
      expect(resource.category).to eq(0)
      expect(resource.total).to eq(0)
      expect(resource.live).to be_falsy
    end
  end

  describe '.find_from_auth with github' do
    before { @user = User.find_from_auth(github_hash, nil) }
    it 'create user' do
      expect(@user.name).to eq(github_hash['info']['name'])
      expect(@user.nickname).to eq(github_hash['info']['nickname'])
      expect(Gh.count).to eq(1)
      expect(@user).to be_valid
      expect(@user.github).to be_truthy
      expect(@user.github_uid).to eq(github_hash['uid'])
      expect(@user.gh).to be_valid
      expect(@user.gh.provider).to eq('github')
      expect(@user.gh.uid).to eq(github_hash['uid'])
      expect(@user.gh.email).to eq(github_hash['info']['email'])
      expect(@user.gh.image).to eq(github_hash['info']['image'])
      # expect(@user.gh.name).to eq(github_hash['info']['name'])
      # expect(@user.gh.nickname).to eq(github_hash['info']['nickname'])
      # expect(@user.gh.profile_url).to eq(github_hash['info']['urls']['GitHub'])
      # expect(@user.gh.blog_url).to eq(github_hash['info']['urls']['Blog'])
    end
  end

  describe '.find_from_auth with twitter after github sign in' do
    before do
      @user = User.find_from_auth(github_hash, nil)
      @user = User.find_from_auth(twitter_hash, @user)
    end

    describe 'User' do
      describe '.count' do
        subject { User.count }
        it { is_expected.to eq(1) }
      end

      describe '.twitter' do
        subject { @user.twitter }
        it { is_expected.to be_truthy }
      end

      describe '.twitter_uid' do
        subject { @user.twitter_uid }
        it { is_expected.to eq(twitter_hash['uid']) }
      end

      describe '.tw' do
        subject { @user.tw }
        it { is_expected.to be_valid }

        describe '.count' do
          subject { Tw.count }
          it { is_expected.to eq(1) }
        end

        describe '.provider' do
          subject { @user.tw.provider }
          it { is_expected.to eq(twitter_hash['provider']) }
        end

        describe '.uid' do
          subject { @user.tw.uid }
          it { is_expected.to eq(twitter_hash['uid']) }
        end

        describe '.access_token' do
          subject { @user.tw.access_token }
          it { is_expected.to eq(twitter_hash['credentials']['token']) }
        end

        describe '.access_token_secret' do
          subject { @user.tw.access_token_secret }
          it { is_expected.to eq(twitter_hash['credentials']['secret']) }
        end

        describe '.image' do
          subject { @user.tw.image }
          it { is_expected.to eq(twitter_hash['info']['image']) }
        end

        describe '.name' do
          subject { @user.tw.name }
          it { is_expected.to eq(twitter_hash['info']['name']) }
        end

        describe '.nickname' do
          subject { @user.tw.nickname }
          it { is_expected.to eq(twitter_hash['info']['nickname']) }
        end

        describe '.location' do
          subject { @user.tw.location }
          it { is_expected.to eq(twitter_hash['info']['location']) }
        end

        describe '.description' do
          subject { @user.tw.description }
          it { is_expected.to eq(twitter_hash['info']['description']) }
        end

        describe '.url' do
          subject { @user.tw.url }
          it { is_expected.to eq(twitter_hash['info']['urls']['Twitter']) }
        end
      end
    end
  end
end
