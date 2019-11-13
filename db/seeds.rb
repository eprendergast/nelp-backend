# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

UserRestaurant.delete_all
User.delete_all
Restaurant.delete_all

u1 = User.create(first_name: "Joe", last_name: "Bloggs", email: "jbloggs@gmail.com", password: "1")
u2 = User.create(first_name: "Jill", last_name: "Smith", email: "jsmith@gmail.com", password: "1")

r1 = Restaurant.create(yelp_business_id: "oK_SLmmAVQg3meguh7LrIA")
r2 = Restaurant.create(yelp_business_id: "YNduANMPzIVE8CzBH7YjEQ")
r3 = Restaurant.create(yelp_business_id: "zJNI06Y2zZQFh9OBSFCdgQ")
r4 = Restaurant.create(yelp_business_id: "0B-ag3J18TatG9H9EQohGg")
r5 = Restaurant.create(yelp_business_id: "IBV7BsXnv2gX68nWUARhjw")

UserRestaurant.create(user_id: User.all.first.id, restaurant_id: r1.id)
UserRestaurant.create(user_id: User.all.first.id, restaurant_id: r2.id)
UserRestaurant.create(user_id: User.all.first.id, restaurant_id: r3.id)
UserRestaurant.create(user_id: User.all.second.id, restaurant_id: r3.id)
UserRestaurant.create(user_id: User.all.second.id, restaurant_id: r4.id)
UserRestaurant.create(user_id: User.all.second.id, restaurant_id: r5.id)
