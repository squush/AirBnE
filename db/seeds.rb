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


# User.create(
#   email: 'a@a.a',
#   password: '123456',
#   username: 'User A',
#   bio: 'Definitely not a criminal'
# )

vinh = User.create(
  email: 'b@b.b',
  password: '123456',
  username: 'vinh_tho',
  bio: 'definitely not a criminal, but i do mug from time to time'
)

Crime.create(
  crime_type: "Mugging",
  area: "Kensington Market, Toronto",
  # Price in dollars
  price: 500,
  user: vinh,
  years_experience: 5
)

10.times do
  user = User.create(
    # TODO: Migrations for username and other missing cols
    #       And rename crime_date to just date
    username: Faker::Superhero.name.gsub(" ","_"),
    email: Faker::Internet.email,
    password: '123456',
    bio: Faker::Lorem.sentence
  )

  print "Creating crimes for #{user.email}: "
  crimes = ["Robbery", "Auto Theft", "Assault", "Mugging", "Jaywalking", "Littering", "Forgery"]
  cities = [
    "NDG, Montreal", "Rosemont, Montreal", "Hochelaga, Montreal",
    "The Beaches, Toronto", "Kensington Market, Toronto", "Roncesvalles, Toronto",
    "Williamsburg, Brooklyn", "Greenwich Village, Manhattan", "Halifax",
    "Paris", "Bishkek", "Macau", "Brussels", "Miami", "Beijing", "Seoul"
  ]

# Login as this user
# User.create(
#   email: 'b@b.b',
#   password: '123456',
#   username: 'User B',
#   bio: 'Definitely not a criminal'
# )
# mugging = Crime.create(
#   crime_type: "mugging",
#   area: "Hochelaga, Montreal",
#   price: 50,
#   user: User.last,
#   years_experience: 8
# )
# auto_theft = Crime.create(
#   crime_type: "auto theft",
#   area: "Hochelaga, Montreal",
#   price: 200,
#   user: User.last,
#   years_experience: 15
# )



# User.create(
#   email: 'c@c.c',
#   password: '123456',
#   username: 'User C',
#   bio: 'Definitely not a criminal'
# )
# jaywalking = Crime.create(
#   crime_type: "jaywalking",
#   area: "Plateau, Montreal",
#   price: 300,
#   user: User.last,
#   years_experience: 21
# )
# littering = Crime.create(
#   crime_type: "littering",
#   area: "Plateau, Montreal",
#   price: 200,
#   user: User.last,
#   years_experience: 18
# )

# Booking.create(
#   target: "Andrew",
#   crime_date: "2022-12-10",
#   status: 0,
#   user: User.first,
#   crime: mugging
# )
# Booking.create(
#   target: "Hugo's car",
#   crime_date: "2022-12-02",
#   status: 0,
#   user: User.first,
#   crime: auto_theft
# )
# Booking.create(
#   target: "rue St Catherine",
#   crime_date: "2022-12-05",
#   status: 0,
#   user: User.second,
#   crime: jaywalking
# )
# Booking.create(
#   target: "parc Angrignon",
#   crime_date: "2022-12-06",
#   status: 0,
#   user: User.second,
#   crime: littering
# )
# Booking.create(
#   target: "Arstanbek's apartment",
#   crime_date: "2022-12-06",
#   status: 0,
#   user: User.third,
#   crime: burglary
# )
# Booking.create(
#   target: "Arstanbek's apartment",
#   crime_date: "2022-12-06",
#   status: 0,
#   user: User.third,
#   crime: burglary
# )



# 10.times do
#   user = User.create(
#     # TODO: Migrations for username and other missing cols
#     #       And rename crime_date to just date
#     username: Faker::Superhero.name.gsub(" ","_"),
#     email: Faker::Internet.email,
#     password: '123456',
#     bio: Faker::Lorem.sentence
#   )

#   print "Creating crimes for #{user.email}: "
#   crimes = ["robbery", "auto theft", "assault", "mugging", "jaywalking", "littering", "forgery"]
#   cities = [
#     "NDG, Montreal", "Rosemont, Montreal", "Hochelaga, Montreal",
#     "The Beaches, Toronto", "Kensington Market, Toronto", "Roncesvalles, Toronto",
#     "Williamsburg, Brooklyn", "Greenwich Village, Manhattan", "Halifax",
#     "Paris", "Bishkek", "Macau", "Brussels", "Miami", "Beijing", "Seoul"
#   ]

#   rand(3..4).times do
#     Crime.create(
#       crime_type: crimes.sample,
#       area: cities.sample,
#       # Price in dollars
#       price: rand(50..1000),
#       user: user,
#       years_experience: rand(0..30)
#     )

#     print "#{Crime.last.crime_type}... "
#   end
#   puts ""
# end

# puts "Creating bookings..."
# 7.times do
#   Booking.create(
#     target: Faker::Name.name,
#     crime_date: Faker::Time.forward(days: 60),
#     status: 0,
#     user: User.all.sample,
#     crime: Crime.all.sample
#   )
#   puts "Created job against #{Booking.last.target}"
# end

puts "Finished!"
