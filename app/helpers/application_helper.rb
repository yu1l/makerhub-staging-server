module ApplicationHelper
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
