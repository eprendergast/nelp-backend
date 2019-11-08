class YelpApiController < ApplicationController

    def restaurants
        restaurants = YelpApi.get_restaurants 
        byebug
        render json: restaurants
    end

    def restaurant 
        byebug
        restaurant = JSON.parse(YelpApi.get_restaurant(params[:id]))
    end



end
