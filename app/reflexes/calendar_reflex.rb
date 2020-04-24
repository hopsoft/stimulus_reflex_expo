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
    @calendar_event = CalendarEvent.new(session_id: session.id, occurs_at: Date.parse(element.dataset["date"]))
    session[:calendar_event_attributes] = @calendar_event.attributes.except(:id)
  end

  def edit_calendar_event
    @start_date = Date.parse(element.dataset["start-date"])
    @calendar_event = CalendarEvent.find(element.dataset[:id])
    session[:calendar_event_attributes] = @calendar_event.attributes.except(:id)
  end

  def destroy_calendar_event
    @start_date = Date.parse(element.dataset["start-date"])
    CalendarEvent.find(element.dataset[:id]).destroy
  end

  def validate_calendar_event
    @start_date = Date.parse(element.dataset["start-date"])
    @calendar_event = CalendarEvent.new(
      session[:calendar_event_attributes].merge(description: element[:value])
    )
    @calendar_event.validate
  end
end
