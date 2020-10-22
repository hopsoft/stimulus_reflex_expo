class TimersController < ApplicationController
  include TimersHelper

  before_action :make_timers

  def show
    @timers = session_timers
  end

  private

  def session_id
    session.id.to_s
  end

  def session_timers
    Timer.where(session_id: session_id).order(:created_at)
  end

  def make_timers
    until session_timers.length >= 4
      Timer.create!(name: 'Count up!', countdown: false, session_id: session_id)
      Timer.create!(name: 'Count down!', countdown: true, duration_in_seconds: [15, 20, 25, 30].sample, session_id: session_id)
    end
  end
end
