# frozen_string_literal: true

class Todo < ApplicationRecord
  validates :session_id, presence: true
  validates :title, presence: true

  scope :completed, -> { where completed: true }
  scope :active, -> { where completed: false }
  scope :old, -> { where arel_table[:created_at].lt(1.month.ago) }

  def active?
    !completed?
  end
end
