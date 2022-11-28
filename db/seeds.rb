# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require 'faker'

10.times do
  User.create!(email: Faker::Internet.email(domain: 'example'), password:Faker::Internet.password(min_length: 8))
end

users = User.all

20.times do 
  Apartment.create!(title: Faker::Lorem.word,
    description: Faker::Lorem.sentence(word_count: 10),
    price: Random.new.rand(1000),
    address: Faker::Address.street_address,
    city: Faker::Address.city,
    postal_code: Faker::Address.postcode,
    surface: Random.new.rand(200),
    furnished: [true, false].sample,
    garden: [true, false].sample,
    basement: [true, false].sample,
    custodian: [true, false].sample,
    user: users.sample
  )
end