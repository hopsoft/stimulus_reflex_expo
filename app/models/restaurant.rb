# frozen_string_literal: true

# == Schema Information
#
# Table name: restaurants
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  stars      :integer          default("0"), not null
#  price      :integer          default("1"), not null
#  category   :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord
  scope :filtered, ->(name) { where("lower(name) LIKE ?", "%#{name&.downcase}%") }
  scope :sorted, ->(column, direction = :forward) { order(Arel.sql("#{column}#{" DESC" if direction == :reverse}")) }
  FILTERS = %w[name stars price category].freeze
end
