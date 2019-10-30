class Todo < ApplicationRecord
  validates :session_id, presence: true
  validates :title, presence: true

  scope :completed, -> { where completed: true }
  scope :active, -> { where completed: false }

  def active?
    !completed?
  end
end
