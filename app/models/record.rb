# == Schema Information
#
# Table name: records
#
#  id              :integer          not null, primary key
#  video_path      :string
#  screenshot_path :string
#  uuid            :string
#  uploaded        :boolean
#  user_id         :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  title           :string
#  duration        :float
#  total           :integer
#  category        :integer
#  private         :boolean
#  group_id        :integer
#

# Record
class Record < ActiveRecord::Base
  validates :user_id, presence: true
  belongs_to :user
  belongs_to :group

  before_create do
    self.duration = 1.0
    self.category = self.user.category
    self.uuid = ((0..9).to_a.sample(3) + ('a'..'z').to_a.sample(3)).shuffle.join
  end

  def screenshot_url
    return "/#{uuid}.png" unless uploaded?
    s3 = AWS::S3.new
    bucket = s3.buckets['live-streaming-staging']
    bucket.acl = :public_read
    obj = bucket.objects["#{screenshot_path}"]
    # obj.acl = :public_read
    obj.public_url.to_param
  end

  def video_url
    return "/#{uuid}.mp4" unless uploaded?
    s3 = AWS::S3.new
    bucket = s3.buckets['live-streaming-staging']
    bucket.acl = :public_read
    obj = bucket.objects["#{video_path}"]
    # obj.acl = :public_read
    obj.public_url.to_param
  end

  def copy_screenshot_to_tmp(input_flv_path)
    flv = FFMPEG::Movie.new("/usr/local/nginx/html/hls/#{user.nickname}.flv")
    screenshot_path = "/usr/local/nginx/html/screenshot/#{user.nickname}.png"
    begin
      File.copy_stream(screenshot_path, "public/#{uuid}.png")
    rescue
      puts "File does not exist on #{screenshot_path}"
    end
    update(screenshot_path: "public/#{uuid}.png", duration: flv.duration)
  end

  def copy_video_to_tmp(input_flv_path)
    FFMPEG::Movie.new("/usr/local/nginx/html/hls/#{user.nickname}.flv").transcode("public/#{uuid}.mp4", '-vcodec copy -acodec copy') do |progress|
      puts progress
    end
    update(video_path: "public/#{uuid}.mp4")
  end

  def upload_to_s3(input_flv_path)
    flv = FFMPEG::Movie.new(input_flv_path)
    screenshot_path = "/usr/local/nginx/html/screenshot/#{user.nickname}.png"
    s3 = AWS::S3.new
    bucket = s3.buckets['live-streaming-staging']

    # Screenshot
    screenshot = bucket.objects["#{user.uuid}/screenshot/#{uuid}.png"]
    screenshot.write(File.open(screenshot_path))
    screenshot.acl = :public_read

    # Video
    video = bucket.objects["#{user.uuid}/records/#{uuid}.mp4"]
    video.write(File.open("public/#{uuid}.mp4"))
    video.acl = :public_read

    update(video_path: video.key, screenshot_path: screenshot.key, uploaded: true, duration: flv.duration)
    File.delete("/usr/local/nginx/html/hls/#{user.nickname}.flv")
    File.delete("/usr/local/nginx/html/screenshot/#{user.nickname}.png")
    File.delete("public/#{uuid}.png")
    File.delete("public/#{uuid}.mp4")
  rescue
    puts 'Error on app/models/record.rb'
  end

  def category_in_text
    %w(UI/UX Ruby Python)[category]
  end
end
