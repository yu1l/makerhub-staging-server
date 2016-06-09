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

# User
class User < ActiveRecord::Base
  enum role: { guest: 0, admin: 1 }
  acts_as_followable
  acts_as_follower

  has_one :channel
  has_many :user_groups
  has_many :groups, through: :user_groups
  has_many :records
  has_many :chats
  has_one :tw
  has_one :gh

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         # :registerable,
         # :recoverable,
         # :rememberable,
         :trackable,
         :validatable,
         :omniauthable

  after_create do
    self.create_channel
  end

  before_create do
    self.live = false
    self.private = false
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
    self.total = 0
  end

  def self.find_from_auth(auth, sign_in_resource=nil)
    return sign_in_resource.add_twitter(auth) if sign_in_resource.present? && auth['provider'] == 'twitter'
    return sign_in_with_github(auth) if auth['provider'] == 'github'
  end

  def add_twitter(auth)
    update(twitter: true, twitter_uid: auth['uid'])
    tw ||= create_tw(provider: 'twitter', uid: auth['uid'])
    tw.update(access_token: auth['credentials']['token'],
              access_token_secret: auth['credentials']['secret'],
              name: auth['info']['name'],
              nickname: auth['info']['nickname'],
              location: auth['info']['location'],
              description: auth['info']['description'],
              image: auth['info']['image'],
              url: auth['info']['urls']['Twitter'])
    # tweet_msg('test http://localhost')
    self
  end

  def self.sign_in_with_github(auth)
    @user = find_or_create_by(github: true, github_uid: auth['uid']) do |user|
      user.nickname = auth['info']['nickname']
      user.name = auth['info']['name']
      user.email = "#{Devise.friendly_token(8)}@design_and_develop.com"
      pass = Devise.friendly_token(8)
      user.password = pass
      user.password_confirmation = pass
      user.add_github_info(auth)
    end
    @user
  end

  def add_github_info(auth)
    update(github: true, github_uid: auth['uid'])
    gh ||= create_gh(provider: 'github', uid: auth['uid'])
    gh.update(email: auth['info']['email'],
              image: auth['info']['image'],
              name: auth['info']['name'],
              nickname: auth['info']['nickname'],
              profile_url: auth['info']['urls']['GitHub'],
              blog_url: auth['info']['urls']['Blog'])
    gh
  end

  def tweet_msg(msg)
    # @client = Twitter::REST::Client.new do |config|
      # config.consumer_key = ENV['TWITTER_CONSUMER_KEY']
      # config.consumer_secret = ENV['TWITTER_CONSUMER_SECRET']
      # config.access_token =  token
      # config.access_token_secret = secret
    # end
    # @client.update(msg)
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

  def category_in_text
    %w(UI/UX Ruby Python)[category]
  end
end
