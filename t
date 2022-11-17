[1mdiff --cc db/seeds.rb[m
[1mindex 6d06b66,e8a6aa2..0000000[m
[1m--- a/db/seeds.rb[m
[1m+++ b/db/seeds.rb[m
[36m@@@ -13,37 -13,128 +13,134 @@@[m [mCrime.destroy_al[m
  User.destroy_all[m
  [m
  puts "Creating criminal users..."[m
[31m- # Simple account for testing[m
[31m- User.create([m
[32m+ [m
[32m+ user_a = User.create([m
    email: 'a@a.a',[m
[32m++<<<<<<< HEAD[m
[32m +  password: '123456',[m
[32m +  username: 'Billy_The_Kid',[m
[32m +  bio: 'I like to litter'[m
[32m++=======[m
[32m+   password: '111111',[m
[32m+   username: 'Definitely Not Vinh Tho',[m
[32m+   bio: 'I am likely not a criminal'[m
[32m+ )[m
[32m+ auto_theft = Crime.create([m
[32m+   crime_type: "auto theft",[m
[32m+   area: "Hochelaga, Montréal",[m
[32m+   price: 175,[m
[32m+   user: user_a,[m
[32m+   years_experience: 15[m
[32m+ )[m
[32m+ burglary = Crime.create([m
[32m+   crime_type: "burglary",[m
[32m+   area: "Hochelaga, Montréal",[m
[32m+   price: 120,[m
[32m+   user: user_a,[m
[32m+   years_experience: 0[m
[32m++>>>>>>> 27ac96a331ca86fe4fa90e191e5430508b94b084[m
  )[m
  [m
[31m- vinh = User.create([m
[32m+ # Login as this user[m
[32m+ billy = User.create([m
    email: 'b@b.b',[m
[31m-   password: '123456',[m
[31m-   username: 'vinh_tho',[m
[31m-   bio: 'definitely not a criminal, but i do mug from time to time'[m
[32m+   password: '111111',[m
[32m+   username: 'Billy the Good Boy',[m
[32m+   bio: 'I am definitely not a criminal'[m
[32m+ )[m
[32m+ mugging = Crime.create([m
[32m+   crime_type: "mugging",[m
[32m+   area: "Hochelaga, Montréal",[m
[32m+   price: 120,[m
[32m+   user: billy,[m
[32m+   years_experience: 8[m
[32m+ )[m
[32m+ jaywalking = Crime.create([m
[32m+   crime_type: "jaywalking",[m
[32m+   area: "Hochelaga, Montréal",[m
[32m+   price: 40,[m
[32m+   user: billy,[m
[32m+   years_experience: 21[m
  )[m
  [m
[31m- Crime.create([m
[31m-   crime_type: "Mugging",[m
[31m-   area: "Kensington Market, Toronto",[m
[31m-   # Price in dollars[m
[31m-   price: 500,[m
[31m-   user: vinh,[m
[31m-   years_experience: 5[m
[32m+ user_c = User.create([m
[32m+   email: 'c@c.c',[m
[32m+   password: '111111',[m
[32m+   username: 'Johnny Bad Boy',[m
[32m+   bio: 'I am probably not a criminal'[m
[32m+ )[m
[32m+ littering = Crime.create([m
[32m+   crime_type: "littering",[m
[32m+   area: "Plateau, Montréal",[m
[32m+   price: 200,[m
[32m+   user: user_c,[m
[32m+   years_experience: 18[m
[32m+ )[m
[32m+ murder = Crime.create([m
[32m+   crime_type: "murder",[m
[32m+   area: "Plateau, Montréal",[m
[32m+   price: 29.99,[m
[32m+   user: user_c,[m
[32m+   years_experience: 0[m
  )[m
  [m
[31m- 10.times do[m
[32m+ # Jobs Billy is being paid for[m
[32m+ Booking.create([m
[32m+   target: "Stephane",[m
[32m+   crime_date: "2022-12-10",[m
[32m+   user: user_a,[m
[32m+   crime: mugging[m
[32m+ )[m
[32m+ Booking.create([m
[32m+   target: "rue Ste.-Catherine",[m
[32m+   crime_date: "2022-12-02",[m
[32m+   user: user_a,[m
[32m+   crime: jaywalking[m
[32m+ )[m
[32m+ Booking.create([m
[32m+   target: "Pascal",[m
[32m+   crime_date: "2022-12-05",[m
[32m+   user: user_c,[m
[32m+   crime: mugging[m
[32m+ )[m
[32m+ Booking.create([m
[32m+   target: "avenue Casgrain",[m
[32m+   crime_date: "2022-12-06",[m
[32m+   user: user_c,[m
[32m+   crime: jaywalking[m
[32m+ )[m
[32m+ [m
[32m+ # Jobs Billy is paying for[m
[32m+ Booking.create([m
[32m+   target: "Hugo's car",[m
[32m+   crime_date: "2022-12-04",[m
[32m+   user: billy,[m
[32m+   crime: auto_theft[m
[32m+ )[m
[32m+ Booking.create([m
[32m+   target: "in front of Le Wagon",[m
[32m+   crime_date: "2022-12-01",[m
[32m+   user: billy,[m
[32m+   crime: littering[m
[32m+ )[m
[32m+ Booking.create([m
[32m+   target: "Andrew",[m
[32m+   crime_date: "2022-12-06",[m
[32m+   user: billy,[m
[32m+   crime: murder[m
[32m+ )[m
[32m+ Booking.create([m
[32m+   target: "Arstanbek's apartment",[m
[32m+   crime_date: "2022-12-07",[m
[32m+   user: billy,[m
[32m+   crime: burglary[m
[32m+ )[m
[32m+ [m
[32m+ 5.times do[m
    user = User.create([m
[31m-     # TODO: Migrations for username and other missing cols[m
[31m-     #       And rename crime_date to just date[m
      username: Faker::Superhero.name.gsub(" ","_"),[m
      email: Faker::Internet.email,[m
[31m-     password: '123456',[m
[32m+     password: '111111',[m
      bio: Faker::Lorem.sentence[m
    )[m
  [m
