module ApplicationHelper
  include Contracts::Core
  include Contracts::Builtin

  Contract String => String
  def stream_url
    return 'makerhub.live' if Rails.env.production?
    '192.168.179.2'
  end

  Contract Num => String
  def category(index)
    %w(UI/UX Ruby Python Javascript Elixir Haskell Rust Go)[index]
  end

  Contract Hash => String
  def app_title(params = {})
    return "#{I18n.t('app.title')} - #{params[:name]}" if params[:name]
    I18n.t('app.title')
  end

  Contract Num => String
  def time(seconds)
    Duration.new(seconds).time_in_str
  end
end

class Duration
  include Contracts::Core
  include Contracts::Builtin

  attr_accessor :hour, :min, :sec

  Contract Num => Num
  def initialize(seconds)
    @hour = seconds / 3600
    @min = (seconds - 3600 * @hour) / 60
    @sec = seconds - 3600 * @hour - @min * 60
  end

  Contract None => String
  def time_in_str
    "#{hour_to_str}#{min_to_str}#{sec_to_str}"
  end

  private

  Contract None => String
  def hour_to_str
    hour > 0 ? "#{hour} #{I18n.t('time.hour')} " : ''
  end

  Contract None => String
  def min_to_str
    return "#{min} #{I18n.t('time.min')} " if hour > 0
    min > 0 ? "#{min} #{I18n.t('time.min')} " : ''
  end

  Contract None => String
  def sec_to_str
    "#{sec} #{I18n.t('time.sec')}"
  end
end
