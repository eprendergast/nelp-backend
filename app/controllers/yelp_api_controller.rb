class YelpApiController < ApplicationController

    def restaurants
        byebug
        restaurants = YelpApi.get_restaurants(params[:location], params[:category])
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
