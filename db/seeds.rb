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
# Simple account for testing
User.create(
  email: 'a@a.a',
  password: '123456',
  username: 'test_user',
  bio: 'Definitely not a criminal'
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
  crimes = ["robbery", "auto theft", "assault", "mugging", "jaywalking", "littering", "forgery"]

  3.times do
    Crime.create(
      crime_type: crimes.sample,
      area: "#{Faker::Address.community}, #{Faker::Address.city}",
      # Price in dollars
      price: rand(50..1000),
      user: user,
      years_experience: rand(0..30)
    )

    print "#{Crime.last.crime_type}... "
  end
  puts ""
end

puts "Creating bookings..."
5.times do
  Booking.create(
    target: Faker::Name.name,
    crime_date: Faker::Time.forward(days: 60),
    status: 0,
    user: User.all.sample,
    crime: Crime.all.sample
  )
  puts "Created job against #{Booking.last.target}"
end

puts "Finished!"
