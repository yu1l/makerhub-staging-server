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
#

# Record
class Record < ActiveRecord::Base
  belongs_to :user

  before_create do
    self.duration = 1.0
    self.category = self.user.category
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
    flv = FFMPEG::Movie.new("/usr/local/nginx/html/hls/#{user.name}.flv")
    screenshot_path = "/usr/local/nginx/html/screenshot/#{user.name}.png"
    begin
      File.copy_stream(screenshot_path, "public/#{uuid}.png")
    rescue
      puts "File does not exist on #{screenshot_path}"
    end
    update(screenshot_path: "public/#{uuid}.png", duration: flv.duration)
  end

  def copy_video_to_tmp(input_flv_path)
    flv = FFMPEG::Movie.new("/usr/local/nginx/html/hls/#{user.name}.flv")
    options = '-vcodec copy -acodec copy'
    mp4_path = "public/#{uuid}.mp4"
    flv.transcode(mp4_path, options) do |progress|
      puts progress
    end
    update(video_path: "public/#{uuid}.mp4")
  end

  def upload_to_s3(input_flv_path)
    flv = FFMPEG::Movie.new(input_flv_path)
    screenshot_path = "/usr/local/nginx/html/screenshot/#{user.name}.png"
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
    File.delete(input_flv_path)
    File.delete(screenshot_path)
    File.delete("public/#{uuid}.png")
    File.delete("public/#{uuid}.mp4")
  rescue
    puts 'Error on app/models/record.rb'
  end

  before_create do
    self.uuid = ((0..9).to_a.sample(3) + ('a'..'z').to_a.sample(3)).shuffle.join
  end
end
