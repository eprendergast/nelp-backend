class YelpApiController < ApplicationController

    def restaurants
        restaurants = JSON.parse(YelpApi.getRestaurants) 
        render json: restaurants
    end

end
