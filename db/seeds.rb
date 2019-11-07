# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

u1 = User.create(first_name: "Joe", last_name: "Bloggs", email: "jbloggs@gmail.com", password: "1")
u2 = User.create(first_name: "Jill", last_name: "Smith", email: "jsmith@gmail.com", password: "1")

r1 = Restaurant.create(yelp_business_id: "E8RJkjfdcwgtyoPMjQ_Olg")
r2 = Restaurant.create(yelp_business_id: "%EFHQU*@JfkiwgtyoPMjQ_Olg")
r3 = Restaurant.create(yelp_business_id: "KLeuf82H34GH6Yu")
r4 = Restaurant.create(yelp_business_id: "h73HHGOOBLAHH")
r5 = Restaurant.create(yelp_business_id: "kjhdiuweMoreGarbagee435gGH")

UserRestaurant.create(user_id: 1, restaurant_id: 1)
UserRestaurant.create(user_id: 1, restaurant_id: 2)
UserRestaurant.create(user_id: 1, restaurant_id: 3)
UserRestaurant.create(user_id: 2, restaurant_id: 1)
UserRestaurant.create(user_id: 2, restaurant_id: 4)
UserRestaurant.create(user_id: 2, restaurant_id: 5)
