module UserRestaurant::Validations
    extend ActiveSupport::Concern

    included do 
        validates :user_id, :restaurant_id, {
            presence: true
        }
        validates :restaurant_id, uniqueness: { scope: :user_id,
            message: "user can add restaurant only once" }
    end

end