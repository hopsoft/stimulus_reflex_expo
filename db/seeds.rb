# frozen_string_literal: true

Restaurant.destroy_all
100.times do
  Restaurant.create(
    name: Faker::Restaurant.name,
    stars: [1, 2, 3, 4, 5].sample,
    price: [1, 2, 3].sample,
    category: Faker::Restaurant.type
  )
end
