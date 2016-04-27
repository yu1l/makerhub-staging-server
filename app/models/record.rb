# == Schema Information
#
# Table name: records
#
#  id         :integer          not null, primary key
#  path       :string
#  uuid       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Record
class Record < ActiveRecord::Base
  def url
    s3 = AWS::S3.new
    bucket = s3.buckets['live-streaming-staging']
    obj = bucket.objects["#{path}"]
    "https://#{obj.url_for(:public_read).host}/#{path}"
  end

  before_create do
    self.uuid = ((0..9).to_a.sample(3) + ('a'..'z').to_a.sample(3)).shuffle.join
  end
end
