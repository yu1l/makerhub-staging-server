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

RSpec.describe User, type: :model do
  it { should validate_presence_of(:email) }
  it { should have_one(:gh) }

  describe '.before_create' do
    let(:resource) { create(:user) }
    subject { resource }
    it { is_expected.to be_valid }
    it 'set default values' do
      expect(resource.uuid).not_to be_nil
      expect(resource.streaming_key).not_to be_nil
      expect(resource.title).to eq(I18n.t('user.default.title'))
      expect(resource.description).to eq(I18n.t('user.default.description'))
      expect(resource.category).to eq(0)
      expect(resource.total).to eq(0)
    end
  end

  describe '.find_from_auth with github' do
    before { @user = User.find_from_auth(github_hash, nil) }
    it 'create user' do
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
end
