# frozen_string_literal: true

class CalendarsController < ApplicationController
  after_action :cleanup

  def show
    @start_date ||= session[:calendar_start_date].present? ? Date.parse(session[:calendar_start_date]) : Date.current
    @start_date = @start_date.to_date.beginning_of_month
    date_range = (@start_date..@start_date.end_of_month)
    @dates = date_range.to_a
    @dates.prepend(@dates.first - 1) until @dates.first.sunday?
    @dates.append(@dates.last + 1) until @dates.last.saturday?
    @calendar_events = CalendarEvent.where(occurs_at: date_range).order(:occurs_at).group_by(&:occurs_at_date)
  end

  private

  def cleanup
    session.delete :calendar_start_date
  end
end
