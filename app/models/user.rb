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
#

# User
class User < ActiveRecord::Base
  acts_as_followable
  acts_as_follower

  has_many :records
  has_many :chats

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         # :registerable,
         # :recoverable,
         # :rememberable,
         :trackable,
         :validatable,
         :omniauthable

  before_create do
    self.uuid = ((0..9).to_a.sample(3) +
                 ('a'..'z').to_a.sample(3) +
                 ('A'..'Z').to_a.sample(3)
                ).shuffle.join
    self.streaming_key = ((0..9).to_a.sample(8) +
                          ('a'..'z').to_a.sample(20) +
                          ('A'..'Z').to_a.sample(20)
                         ).shuffle.join
    self.title = I18n.t('user.default.title')
    self.description = I18n.t('user.default.description')
    self.category = 0
  end

  def self.find_or_create_from_twitter(auth)
    token = auth[:credentials][:token]
    secret = auth[:credentials][:secret]
    provider = auth[:provider]
    uid = auth[:uid]
    nickname = auth[:info][:nickname]
    image_url = auth[:info][:image]
    name = auth[:info][:name]
    location = auth[:info][:location]
    description = auth[:info][:description]
    twitter_url = auth[:info][:Twitter]

    find_or_create_by(provider: provider, uid: uid) do |user|
      user.email = "#{Devise.friendly_token(8)}@design_and_develop.com"
      pass = Devise.friendly_token(8)
      user.password = pass
      user.password_confirmation = pass
      user.name = nickname
      user.twitter_access_token = token
      user.twitter_access_token_secret = secret
      user.twitter_nickname = nickname
      user.twitter_image_url = image_url
      user.twitter_name = name
      user.twitter_url = twitter_url
      user.twitter_description = description
      user.twitter_location = location
    end
    # tweet_msg('test http://localhost')
  end

  def tweet_msg(msg)
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      config.access_token =  token
      config.access_token_secret = secret
    end
    @client.update(msg)
    # https://card-dev.twitter.com/validator
    # <meta name="description" content="プログラミングスクール【TechAcademy（テックアカデミー）】のオフィシャルサイト。エンジニアになれるオンラインブートキャンプを開催。大手IT企業を中心に100社以上のプログラミング研修実績あり。" />
    # <meta name="keywords" content="プログラミング, ブートキャンプ, エンジニア, ruby on rails, パーソナルメンター" />
    # <link rel="canonical" href="https://techacademy.jp/" />
    # <meta property="og:type" content="website" />
    # <meta property="og:title" content="未経験からプロを育てるオンラインブートキャンプ | TechAcademy [テックアカデミー]" />
    # <meta property="og:description" content="プログラミング学習で、もう挫折しない。パーソナルメンターがつくオンラインブートキャンプ。" />
    # <meta property="og:url" content="https://techacademy.jp/" />
    # <meta property="og:image" content="https://techacademy.jp/assets/og-image-6415b5a10c909883007740c2694dab82.jpg" />
    # <meta name="twitter:card" content="summary_large_image" />
    # <meta name="twitter:site" content="@techacademy" />
    # <meta name="twitter:creator" content="@techacademy" />
    # <meta name="twitter:title" content="未経験からプロを育てるオンラインブートキャンプ | TechAcademy [テックアカデミー]" />
    # <meta name="twitter:description" content="プログラミング学習で、もう挫折しない。パーソナルメンターがつくオンラインブートキャンプ。" />
    # <meta name="twitter:image" content="https://techacademy.jp/assets/og-image-6415b5a10c909883007740c2694dab82.jpg" />
  end
end
