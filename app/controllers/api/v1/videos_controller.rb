class Api::V1::VideosController < Api::V1::ApiController
  def all
    @videos = Record.all.map do |r|
      {
        uuid: r[:uuid],
        title: r[:title],
        video_url: r.video_url,
        thumbnail_url: r.screenshot_url,
        duration: r[:duration],
        pv: r[:total],
        category: r.category_in_text,
        user: {
          name: r.user.name,
          nickname: r.user.gh.nickname,
          thumbnail: r.user.gh.image
        }
      }
    end
    render json: @videos
  end

  def user
    @user = User.find_by(user_params)
    @videos = @user.records.map do |r|
      {
        uuid: r[:uuid],
        title: r[:title],
        video_url: r.video_url,
        thumbnail_url: r.screenshot_url,
        duration: r[:duration],
        pv: r[:total],
        category: r.category_in_text,
        user: {
          name: @user.name,
          nickname: @user.gh.nickname,
          thumbnail: @user.gh.image
        }
      }
    end
    render json: @videos
  end

  def video
    @user = User.find_by(user_params)
    @video = @user.records.find_by(record_params)
    @response = {
      play_url: @video.video_url,
      thumbnail: @video.screenshot_url,
      title: @video.title,
      duration: @video.duration,
      pv: @video.total,
      category: @video.category_in_text,
      user: {
        name: @user.name,
        nickname: @user.nickname,
        avatar: @user.gh.image
      }
    }
    render json: @response
  end

  private

  def user_params
    params.permit(:nickname)
  end

  def record_params
    params.permit(:uuid)
  end
end
