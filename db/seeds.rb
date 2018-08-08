# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Buoy.destroy_all
Booking.destroy_all
User.destroy_all

puts "just deleted the old seed"

# puts "create 4 alocando users"

User.create(email: "kaj@alocando.com", password: "alocando123", first_name: Faker::Name.first_name ,last_name: Faker::Name.last_name)
User.create(email: "sam@alocando.com", password: "alocando123", first_name: Faker::Name.first_name , last_name: Faker::Name.last_name)
User.create(email: "scarlett@alocando.com", password: "alocando123", first_name: Faker::Name.first_name , last_name: Faker::Name.last_name)
User.create(email: "julio@alocando.com", password: "alocando123", first_name: Faker::Name.first_name , last_name: Faker::Name.last_name)

puts "users created"

puts "creating 20 buoys"

20.times do
  buoy = Buoy.new(
     title: Faker::Name.first_name,
     age: rand(1..7),
     description: Faker::Lorem.paragraph,
     category: ["Food", "Animal", "Unicorn", "Cartoon", "Classic", "Weird"].sample,
     capacity: rand(1..10),
     price_per_day: rand(1..99),
     street: Faker::Address.street_name,
     number: rand(1..56),
     city: Faker::Address.city,
     country: Faker::Address.country,
     postal_code: Faker::Address.postcode,
     photo: ["roo2qfu9yru9q8xcljdn","wdzn743ly3jyvpb9tzy7","xbuzlknvmars6um94fef","hlzga94d2oa4nlzu9jzv","eu4tghqnmpaczzhfpejr"].sample
    )
  buoy.user = User.first
  buoy.save!
end

puts "created 20 buoys - yeah buddy!"


