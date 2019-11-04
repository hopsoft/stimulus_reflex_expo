class Mission < ApplicationRecord
  include MissionFactory
  validates :session_id, presence: true
  before_save { |m| m.title = brainstorm unless m.title? }
  has_paper_trail

  scope :completed, -> { where completed: true }
  scope :active, -> { where completed: false }

  def active?
    !completed?
  end
end
