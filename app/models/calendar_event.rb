# frozen_string_literal: true

class CalendarEvent < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  # relationships .............................................................

  # validations ...............................................................
  validates :description, length: {minimum: 6, maximum: 240, allow_blank: false}
  validates :occurs_at, presence: true

  # callbacks .................................................................
  # scopes ....................................................................
  # additional config (i.e. accepts_nested_attribute_for etc...) ..............
  # class methods .............................................................

  # public instance methods ...................................................

  def occurs_at_date
    occurs_at.to_date
  end

  def assign_hour(params)
    hour = params[:hour].to_i
    hour += 12 if params[:meridian] == "PM"
    self.occurs_at = occurs_at.change(hour: hour)
  end

  # protected instance methods ................................................
  # private instance methods ..................................................
end
