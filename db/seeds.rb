# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

puts "Cleaning database..."
Crime.destroy_all
User.destroy_all

puts "Creating standard users and crimes..."

user_a = User.create(
  email: 'a@a.a',
  password: '111111',
  username: 'Definitely Not Vinh Tho',
  bio: 'I am likely not a criminal'
)
auto_theft = Crime.create(
  crime_type: "auto theft",
  area: "Hochelaga, Montreal",
  price: 175,
  user: user_a,
  years_experience: 15
)
burglary = Crime.create(
  crime_type: "burglary",
  area: "Hochelaga, Montreal",
  price: 120,
  user: user_a,
  years_experience: 0
)

# Login as this user
johnny = User.create(
  email: 'b@b.b',
  password: '111111',
  username: "Johnny Big Boy Carlito",
  bio: 'I am definitely not a criminal'
)
mugging = Crime.create(
  crime_type: "mugging",
  area: "Hochelaga, Montreal",
  price: 120,
  user: johnny,
  years_experience: 8
)
jaywalking = Crime.create(
  crime_type: "jaywalking",
  area: "Hochelaga, Montreal",
  price: 40,
  user: johnny,
  years_experience: 21
)
prank_call = Crime.create(
  crime_type: "prank call",
  area: "Hochelaga, Montreal",
  price: 20,
  user: johnny,
  years_experience: 21
)

user_c = User.create(
  email: 'c@c.c',
  password: '111111',
  username: 'Billy Bad Boy',
  bio: 'I am probably not a criminal'
)
littering = Crime.create(
  crime_type: "littering",
  area: "Plateau, Montreal",
  price: 200,
  user: user_c,
  years_experience: 18
)
espionage = Crime.create(
  crime_type: "espionage",
  area: "Plateau, Montreal",
  price: 30,
  user: user_c,
  years_experience: 0
)

puts "Creating standard bookings..."

# Jobs johnny is being paid for

# Jobs johnny is paying for
Booking.create(
  target: "Hugo's car",
  date: "2022-12-04",
  user: johnny,
  crime: auto_theft
)

Booking.create(
  target: "Andrew",
  date: "2022-12-06",
  user: johnny,
  crime: espionage
)
Booking.create(
  target: "Arstanbek's apartment",
  date: "2022-12-07",
  user: johnny,
  crime: burglary
)

puts "Creating random users..."
4.times do
  user = User.create(
    username: Faker::Superhero.name.gsub(" ","_"),
    email: Faker::Internet.email,
    password: '111111',
    bio: Faker::Lorem.sentence
  )

  print "Creating crimes for #{user.email}: "
  crimes = ["robbery", "auto theft", "assault", "mugging", "jaywalking", "littering", "forgery"]
  cities = [
    "NDG, Montreal", "Hochelaga, Montreal", "The Beaches, Toronto", "Kensington Market, Toronto",
    "Bishkek", "Manhattan", "Halifax", "Paris", "Brussels", "Miami"
  ]

  3.times do
    Crime.create(
      crime_type: crimes.sample,
      area: cities.sample,
      price: rand(350..1000),
      user: user,
      years_experience: rand(0..30)
    )

    print "#{Crime.last.crime_type}... "
  end
  puts ""
end

puts "Finished!"
