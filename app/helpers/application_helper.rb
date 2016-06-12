module ApplicationHelper
  def stream_url
    return 'makerhub.live' if Rails.env.production?
    '192.168.179.2'
  end

  def category(index)
    %w(UI/UX Ruby Python Javascript Elixir Haskell Rust Go)[index]
  end

  def app_title(params)
    return "#{I18n.t('app.title')} - #{params[:name]}" if params[:name]
    I18n.t('app.title')
  end

  def time(seconds)
    Duration.new(seconds).time_in_str
  end

  class Duration
    attr_accessor :hour, :min, :sec

    def initialize(seconds)
      @hour = seconds / 3600
      @min = (seconds - 3600 * @hour) / 60
      @sec = seconds - 3600 * @hour - @min * 60
    end

    def time_in_str
      "#{hour_to_str}#{min_to_str}#{sec_to_str}"
    end

    private

    def hour_to_str
      hour > 0 ? "#{hour} #{I18n.t('time.hour')} " : ''
    end

    def min_to_str
      return "#{min} #{I18n.t('time.min')} " if hour > 0
      min > 0 ? "#{min} #{I18n.t('time.min')} " : ''
    end

    def sec_to_str
      "#{sec} #{I18n.t('time.sec')}"
    end
  end
end
