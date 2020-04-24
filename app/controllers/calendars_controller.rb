# frozen_string_literal: true

class CalendarsController < ApplicationController
  def show
    @start_date ||= Date.parse(params[:date])
    @start_date = @start_date.to_date.beginning_of_month
    date_range = (@start_date..@start_date.end_of_month)
    @dates = date_range.to_a
    @dates.prepend(@dates.first - 1) until @dates.first.sunday?
    @dates.append(@dates.last + 1) until @dates.last.saturday?
    @calendar_events = CalendarEvent.where(occurs_at: date_range).order(:occurs_at).group_by(&:occurs_at_date)
  end
end
