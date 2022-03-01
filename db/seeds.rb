# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'

Booking.destroy_all
Boat.destroy_all
User.destroy_all

puts 'Creating fake data...'
15.times do
  sailor = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    password: "123456789"
  )
  sailor.save!

  boat = Boat.new(
    title: Faker::JapaneseMedia::DragonBall.character,
    description: Boat::BOAT_DESCRIPTIONS.sample,
    location: Boat::LOCATIONS.sample,
    boat_type: Boat::BOAT_TYPES.sample,
    price: Boat::PRICES.sample,
    user: sailor
  )
  boat.save!

  client = User.new(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    phone: Faker::PhoneNumber.cell_phone_in_e164,
    password: "123456789"
  )

  client.save!

  booking = Booking.new(
    user: client,
    boat: boat,
    start_date: Date.today,
    end_date: Date.today + rand(4..30)
  )
  booking.total = (booking.end_date - booking.start_date) * boat.price
  booking.save!
end
puts 'Finished!'
