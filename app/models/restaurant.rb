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
  scope :category, ->(category) { where(category: category) if category.present? }
  scope :stars, ->(stars) { where(stars: stars..) if stars.present? }
  scope :price, ->(price) { where(price: price.split(",")) if price.present? }
end
