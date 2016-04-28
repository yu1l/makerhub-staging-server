# == Schema Information
#
# Table name: records
#
#  id              :integer          not null, primary key
#  video_path      :string
#  screenshot_path :string
#  uuid            :string
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

# Record
class Record < ActiveRecord::Base
  belongs_to :user

  def screenshot_url
    s3 = AWS::S3.new
    bucket = s3.buckets['live-streaming-staging']
    bucket.acl = :public_read
    obj = bucket.objects["#{screenshot_path}"]
    obj.acl = :public_read
    obj.public_url.to_param
  end

  def video_url
    s3 = AWS::S3.new
    bucket = s3.buckets['live-streaming-staging']
    bucket.acl = :public_read
    obj = bucket.objects["#{video_path}"]
    obj.acl = :public_read
    obj.public_url.to_param
  end

  before_create do
    self.uuid = ((0..9).to_a.sample(3) + ('a'..'z').to_a.sample(3)).shuffle.join
  end
end
