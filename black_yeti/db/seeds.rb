# frozen_string_literal: true

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
20.times do
  Service.create(
    name: "Service-#{Faker::Number.number}",
    tag: Faker::Book.title,
    description: Faker::Lorem.paragraph,
    published: [true, false].sample
  )
end

Service.all.each do |service|
  [2,4,6].sample.times do
    ServiceFeature.create(
      name: "Service Feature - #{Faker::Number.number}",
      description: Faker::Lorem.paragraph,
      published: [true, false].sample,
      service_id: service.id
    )
  end
end

20.times do
  Booking.create(
    booking_at: 7.days.before,
    state: "On Progress",
    user_id: User.first.id
  )
end
