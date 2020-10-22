# frozen_string_literal: true

module TimersHelper
  def data_for_reflex(name:, action: 'click', method: 'perform', combined: false, attrs: {})
    data = {
      reflex: "#{action}->#{name}##{method}"
    }
    data[:reflex_dataset] = 'combined' if combined
    data.merge!(attrs) if attrs.keys.length.positive?
    data
  end

  def data_for_timer(timer:, controller: 'timer')
    { controller: controller,
      timer_status: timer.status,
      timer_id: timer.id,
      timer_start: timer.started_at.to_f * 1000,
      timer_current: timer.value_in_seconds.to_i,
      timer_countdown: timer.countdown?,
      timer_duration: timer.duration_in_seconds.to_i }
  end

  def icon_for_timer(timer)
    if timer.started?
      '&#xf04b'
    elsif timer.paused?
      '&#xf04c'
    else
      '&#xf04d'
    end
  end
end
