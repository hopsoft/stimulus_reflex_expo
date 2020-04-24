# frozen_string_literal: true

# == Schema Information
#
# Table name: todos
#
#  id         :bigint           not null, primary key
#  completed  :boolean          default(FALSE), not null
#  title      :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  session_id :string           not null
#
# Indexes
#
#  index_todos_on_completed   (completed)
#  index_todos_on_session_id  (session_id)
#
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
