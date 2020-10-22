class Timer < ApplicationRecord
  def display_time
    countdown? ? (duration_in_seconds - value) : value
  end

  def value
    value_in_seconds.to_i
  end

  def status
    return :ended if ended?
    return :paused if paused?
    return :active if active?

    :unstarted
  end

  # mini state machine
  # unstarted -> started
  # started -> paused
  # paused -> started
  # any -> ended
  # ended -> nothing

  def ended?
    ended_at.present?
  end

  def end!
    update!(started_at: nil, paused_at: nil, ended_at: Time.current, value_in_seconds: value_right_now)
  end

  def reset!
    update!(started_at: nil, ended_at: nil, paused_at: nil, value_in_seconds: 0)
  end

  def pause!
    return false if ended?
    return false if paused?

    update!(started_at: nil, paused_at: Time.current, value_in_seconds: value_right_now)
  end

  def paused?
    return false if ended?

    paused_at.present?
  end

  def start!
    return false if started?
    return false if ended?

    update!(started_at: Time.current, paused_at: nil)
  end

  def started?
    return false if paused?
    return false if ended?

    started_at.present?
  end
  alias active? started?

  private

  def value_right_now
    value_in_seconds.to_i + (Time.current - started_at).to_i
  end
end
