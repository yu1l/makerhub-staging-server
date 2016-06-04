module ApplicationHelper
  def stream_url
    return 'makerhub.live' if Rails.env.production?
    return '192.168.179.2' if Rails.env.development?
  end

  def category(index)
    %w(UI/UX Ruby Python Javascript Elixir Haskell Rust Go)[index]
  end

  def app_title(params)
    return "#{I18n.t('app.title')} - #{params[:name]}" if params[:name]
    I18n.t('app.title')
  end

  def time(seconds)
    hour = seconds / 3600
    min = (seconds - 3600 * hour) / 60
    sec = seconds - 3600 * hour - min * 60
    if hour > 0
      return "#{hour} #{I18n.t('time.hour')} #{min} #{I18n.t('time.min')} #{sec} #{I18n.t('time.sec')}"
    elsif min > 0
      return "#{min} #{I18n.t('time.min')} #{sec} #{I18n.t('time.sec')}"
    else
      return "#{sec} #{I18n.t('time.sec')}"
    end
  end
end
