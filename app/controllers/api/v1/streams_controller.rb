class Api::V1::StreamsController < Api::V1::ApiController
  def all
    @users = User.where(live: true).map do |u|
      {
        thumbnail: "http://makerhub.live/screenshot/#{u.gh.nickname}.png",
        title: u.title,
        summary: u.description,
        viewers: u.total,
        category: u.category_in_text,
        user: {
          name: u.name,
          nickname: u.gh.nickname,
          avatar: u.gh.image
        }
      }
    end

    render json: { streams: @users }
  end
end
