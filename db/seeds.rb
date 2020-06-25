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

MetricsEntry.destroy_all
(Date.parse("2020-05-01")..Date.parse("2020-05-31")).each do |date|
  MetricsEntry.create(
    date: date,
    response_time: Random.new.rand(150..2500),
    requests_per_second: Random.new.rand(20.0)
  )
end
