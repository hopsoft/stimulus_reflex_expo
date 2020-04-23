# frozen_string_literal: true

class CalendarsController < ApplicationController
  def show
  end

  def start_date
    @start_date = (@start_date || Date.current).to_date.beginning_of_month
  end
  helper_method :start_date

  def end_date
    @end_date = start_date.end_of_month
  end

  def date_range
    start_date..end_date
  end

  def dates
    list = date_range.to_a
    list.prepend(list.first - 1) until list.first.sunday?
    list.append(list.last + 1) until list.last.saturday?
    list
  end
  helper_method :dates
end
