class YelpApiController < ApplicationController

    def restaurants
        restaurants = YelpApi.get_restaurants 
        render json: restaurants
    end

    def restaurant 
        restaurant = JSON.parse(YelpApi.get_restaurant(params[:business_id]))
        render json: restaurant
    end

    def restaurant_reviews
        reviews = JSON.parse(YelpApi.get_reviews(params[:business_id]))
        render json: reviews
    end

end
