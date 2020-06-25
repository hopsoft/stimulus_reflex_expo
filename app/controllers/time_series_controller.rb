# frozen_string_literal: true

class TimeSeriesController < ApplicationController
  def show
    @current_data_source = session[:data_source] || :response_time
    @start_date = session[:start_date] || MetricsEntry.minimum(:date)
    @end_date = session[:end_date] || MetricsEntry.maximum(:date)
    @metrics_entries = MetricsEntry.where(date: @start_date..@end_date)
  end
end
