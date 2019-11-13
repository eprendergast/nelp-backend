class YelpApiController < ApplicationController

    def restaurants
        if !params[:location]
            params[:location] = "london"
        end
        if !params[:category]
            params[:category] = "all"
        end
        restaurant_data = YelpApi.get_restaurants(params[:location], params[:category])
        restaurant_data_with_reviews = YelpApi.get_review_data(restaurant_data)
        render json: restaurant_data_with_reviews.to_json
    end

    def restaurant 
        restaurant = YelpApi.get_restaurant(params[:business_id])
        render json: restaurant.to_json
    end

    def restaurant_reviews
        reviews = YelpApi.get_reviews(params[:business_id])
        render json: reviews.to_json
    end

end
