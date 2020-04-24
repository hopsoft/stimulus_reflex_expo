# frozen_string_literal: true

class CalendarReflex < ApplicationReflex
  def new_calendar_event
    @calendar_event = CalendarEvent.new(session_id: session.id, occurs_at: Date.parse(element.dataset["date"]))
    session[:calendar_event_attributes] = @calendar_event.attributes
  end

  def edit_calendar_event
    @calendar_event = CalendarEvent.find(element.dataset[:id])
  end

  def destroy_calendar_event
    CalendarEvent.find(element.dataset[:id]).destroy
  end

  def validate_calendar_event
    @calendar_event = CalendarEvent.where(id: element.dataset[:id]).first_or_initialize(
      session[:calendar_event_attributes].merge(description: element[:value])
    )
    @calendar_event.validate
  end
end
