# frozen_string_literal: true

# == Schema Information
#
# Table name: calendar_events
#
#  id          :bigint           not null, primary key
#  description :text             not null
#  occurs_at   :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  session_id  :string           not null
#
# Indexes
#
#  index_calendar_events_on_session_id_and_occurs_at  (session_id,occurs_at)
#
class CalendarEvent < ApplicationRecord
  # extends ...................................................................
  # includes ..................................................................
  # relationships .............................................................

  # validations ...............................................................
  validates :description, length: {minimum: 6, maximum: 240, allow_blank: false}
  validates :occurs_at, presence: true

  # callbacks .................................................................

  # scopes ....................................................................
  scope :old, -> { where arel_table[:created_at].lt(1.month.ago) }

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
