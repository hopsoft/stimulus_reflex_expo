# frozen_string_literal: true

class CalendarEventsController < ApplicationController
  after_action :cleanup

  def create
    calendar_event = CalendarEvent.new(calendar_event_params)
    calendar_event.assign_hour hour_params
    calendar_event.save
    redirect_to calendar_path(calendar_event.occurs_at.beginning_of_month.iso8601)
  end

  def update
    calendar_event = CalendarEvent.find(params[:id])
    calendar_event.assign_attributes calendar_event_params
    calendar_event.assign_hour hour_params
    calendar_event.save
    redirect_to calendar_path(calendar_event.occurs_at.beginning_of_month.iso8601)
  end

  private

  def calendar_event_params
    params.require(:calendar_event).permit(:occurs_at, :description).merge(session_id: session.id)
  end

  def hour_params
    params.require(:calendar_event).permit(:hour, :meridian)
  end

  def cleanup
    CalendarEvent.old.delete_all
  end
end
