# frozen_string_literal: true

class TimerReflex < ApplicationReflex
  def timer
    @timer ||= Timer.find(element['data-timer-id'])
  end

  def morph_timer(timer)
    morph(dom_id(timer), TimersController.render(partial: 'timer', locals: { timer: timer }))
  end

  def end
    timer.end!
    morph_timer(timer)
  end

  def toggle
    timer.active? ? timer.pause! : timer.start!
    morph_timer(timer)
  end

  def reset
    timer.reset!
    morph_timer(timer)
  end
end
