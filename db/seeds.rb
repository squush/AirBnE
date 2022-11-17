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

puts "Creating criminal users..."

user_a = User.create(
  email: 'a@a.a',
  password: '111111',
  username: 'Definitely Not Vinh Tho',
  bio: 'I am likely not a criminal'
)
auto_theft = Crime.create(
  crime_type: "auto theft",
  area: "Hochelaga, Montréal",
  price: 175,
  user: user_a,
  years_experience: 15
)
burglary = Crime.create(
  crime_type: "burglary",
  area: "Hochelaga, Montréal",
  price: 120,
  user: user_a,
  years_experience: 0
)

# Login as this user
billy = User.create(
  email: 'b@b.b',
  password: '111111',
  username: 'Billy the Good Boy',
  bio: 'I am definitely not a criminal'
)
mugging = Crime.create(
  crime_type: "mugging",
  area: "Hochelaga, Montréal",
  price: 120,
  user: billy,
  years_experience: 8
)
jaywalking = Crime.create(
  crime_type: "jaywalking",
  area: "Hochelaga, Montréal",
  price: 40,
  user: billy,
  years_experience: 21
)
prank_call = Crime.create(
  crime_type: "prank all",
  area: "Hochelaga, Montréal",
  price: 20,
  user: billy,
  years_experience: 21
)

user_c = User.create(
  email: 'c@c.c',
  password: '111111',
  username: 'Johnny Bad Boy',
  bio: 'I am probably not a criminal'
)
littering = Crime.create(
  crime_type: "littering",
  area: "Plateau, Montréal",
  price: 200,
  user: user_c,
  years_experience: 18
)
espionage = Crime.create(
  crime_type: "espionage",
  area: "Plateau, Montréal",
  price: 29.99,
  user: user_c,
  years_experience: 0
)

# Jobs Billy is being paid for
Booking.create(
  target: "Stephane",
  date: "2022-12-10",
  user: user_a,
  crime: mugging
)
Booking.create(
  target: "rue Ste.-Catherine",
  date: "2022-12-02",
  user: user_a,
  crime: prank_call
)
Booking.create(
  target: "Pascal",
  date: "2022-12-05",
  user: user_c,
  crime: mugging
)
Booking.create(
  target: "avenue Casgrain",
  date: "2022-12-06",
  user: user_c,
  crime: jaywalking
)

# Jobs Billy is paying for
Booking.create(
  target: "Hugo's car",
  date: "2022-12-04",
  user: billy,
  crime: auto_theft
)
Booking.create(
  target: "in front of Le Wagon",
  date: "2022-12-01",
  user: billy,
  crime: littering
)
Booking.create(
  target: "Andrew",
  date: "2022-12-06",
  user: billy,
  crime: espionage
)
Booking.create(
  target: "Arstanbek's apartment",
  date: "2022-12-07",
  user: billy,
  crime: burglary
)

5.times do
  user = User.create(
    username: Faker::Superhero.name.gsub(" ","_"),
    email: Faker::Internet.email,
    password: '111111',
    bio: Faker::Lorem.sentence
  )

  print "Creating crimes for #{user.email}: "
  crimes = ["robbery", "auto theft", "assault", "mugging", "jaywalking", "littering", "forgery"]
  cities = [
    "NDG, Montréal", "Hochelaga, Montréal", "The Beaches, Toronto", "Kensington Market, Toronto",
    "Bishkek", "Manhattan", "Halifax", "Paris", "Macau", "Brussels", "Miami", "Beijing", "Seoul"
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
