class CreateUserRestaurants < ActiveRecord::Migration[6.0]
  def change
    create_table :user_restaurants do |t|
      t.integer :user_id
      t.integer :restaurant_id
      t.timestamps
    end
  end
end
