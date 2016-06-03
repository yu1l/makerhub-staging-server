class Api::V1::VideosController < Api::V1::ApiController
  def all
    @videos = Record.all.map do |r|
      {
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

  private

  def user_params
    params.permit(:nickname)
  end
end
