# frozen_string_literal: true

# == Schema Information
#
# Table name: restaurants
#
#  id         :bigint           not null, primary key
#  category   :string           not null
#  name       :string           not null
#  price      :integer          default(1), not null
#  stars      :integer          default(0), not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Restaurant < ApplicationRecord
  scope :search, ->(query) {
    query = sanitize_sql_like(query)
    where(arel_table[:name].matches("%#{query}%"))
      .or(where(arel_table[:category].matches("%#{query}%")))
  }
end
