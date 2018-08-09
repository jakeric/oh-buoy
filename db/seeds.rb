# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

img1 = "https://images.unsplash.com/photo-1521744802108-1654ef5093c2?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=c740557216a15827737acdea40b0c562&auto=format&fit=crop&w=1950&q=80"
img2 = "https://images.unsplash.com/photo-1529920871029-c78f9990929b?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=54ea7a21b2a389c698855d6487668aba&auto=format&fit=crop&w=1950&q=80"
img3 = "https://images.unsplash.com/photo-1504698277408-fb59c841bb12?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=0c0d139720b7aa20b14401112ce20ad4&auto=format&fit=crop&w=1950&q=80"
img4 = "https://images.unsplash.com/photo-1520911544319-dae550e93e53?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=e5950825598c661a109d32bdc144d482&auto=format&fit=crop&w=1950&q=80"
img5 = "https://images.unsplash.com/photo-1531686071181-3fa95c9950a1?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=d5170060c49854a556f4d5390aad02e8&auto=format&fit=crop&w=1579&q=80"
img6 = "https://images.unsplash.com/photo-1521745058198-7a294f8e4267?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=49a2cb0286200a4450d68976d93b4f8e&auto=format&fit=crop&w=1950&q=80"
img7 = "https://images.unsplash.com/photo-1522689016624-5097c68089ac?ixlib=rb-0.3.5&s=7ded290759d65511639f57bc3acc1bcb&auto=format&fit=crop&w=1400&q=80"
img8 = "https://i.pinimg.com/564x/5d/dc/3c/5ddc3c10e2351482c0304861dc56f7b7.jpg"
img9 = "https://i.pinimg.com/564x/3e/5e/c0/3e5ec099db0f8ce8d95eca34f01c044b.jpg"
img10 = "https://i.pinimg.com/564x/d3/d0/e0/d3d0e08292ede9bdc7cc6b2575be4879.jpg"


inflatable_img_url = [img1, img2, img3, img4, img5, img6, img7, img8, img9, img10]


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
     photo: open(inflatable_img_url.sample)
    )
  buoy.user = User.last
  buoy.save!
end

puts "created 20 buoys - yeah buddy!"


