# frozen_string_literal: true

class CalendarReflex < ApplicationReflex
  def today
    @start_date = Date.current
  end

  def change_month
    @start_date = Date.parse(element.dataset["start-date"])
  end

  def new_calendar_event
    @start_date = Date.parse(element.dataset["start-date"])
    @calendar_event = CalendarEvent.new(occurs_at: Date.parse(element.dataset["date"]))
  end
end
