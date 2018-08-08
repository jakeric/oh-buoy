# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "creating 20 buoys"

Buoy.destroy_all

puts "just deleted the old seed"

20.times do
  buoy = Buoy.new(
     title: Faker::FunnyName.name,
     age: rand(1..67),
     description: Faker::Demographic.race,
     category: ["Food", "Animal", "Unicorn", "Cartoon", "Classic", "Weird"].sample,
     capacity: rand(1..10),
     price_per_day: rand(1..99),
     street: Faker::Address.street_name,
     number: rand(1..56),
     city: Faker::Address.city,
     country: Faker::Address.country,
     postal_code: Faker::Address.postcode,
    )
  buoy.user = User.last
  buoy.save!
end

puts "created 20 buoys - yeah buddy!"
