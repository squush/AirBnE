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
3.times do
  user = User.create(
    email: Faker::Internet.email,
    password: 'qweasd'
  )

  puts "Creating crimes for #{user}"
  3.times do
    Crime.create(
      crime_type: Faker::Hobby.activity,
      area: Faker::Fantasy::Tolkien.location,
      price: rand(0..1000.0)
      user_id: user
    )
  end

  puts "Created #{user.email}"
end

puts "Creating bookings..."
3.times do
  Booking.new(
    # TODO: Get this working
    target: Faker::Ancient.god,
    crime_date: Faker::Date.between(from: '2022-12-01', to: '2023-11-31'),
    status: 0,
    user_id: User.all.sample.id,
    crime_id: Crime.all.sample.id
  )


end

puts "Finished!"
