class RestaurantsController < ApplicationController

    def index
        restaurants = Restaurant.all 
        render json: {restaurants: restaurants}
    end

end
