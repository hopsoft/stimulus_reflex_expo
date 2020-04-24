# frozen_string_literal: true

class CalendarEventsController < ApplicationController
  def create
    calendar_event = CalendarEvent.new(calendar_event_params)
    set_occurs_at calendar_event
    calendar_event.save
    session[:calendar_start_date] = calendar_event.occurs_at.iso8601
    redirect_to calendar_path
  end

  def update
    calendar_event = CalendarEvent.find(params[:id])
    calendar_event.assign_attributes calendar_event_params
    set_occurs_at calendar_event
    calendar_event.save
    session[:calendar_start_date] = calendar_event.occurs_at.iso8601
    redirect_to calendar_path
  end

  private

  def calendar_event_params
    params.require(:calendar_event).permit(:occurs_at, :description).merge(session_id: session.id)
  end

  def set_occurs_at(calendar_event)
    hour = params.dig(:calendar_event, :hour).to_i
    hour += 12 if params.dig(:calendar_event, :meridian) == "PM"
    calendar_event.occurs_at = calendar_event.occurs_at.change(hour: hour)
  end
end
