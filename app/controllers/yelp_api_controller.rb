class YelpApiController < ApplicationController

    def restaurants
        restaurant_data = YelpApi.get_restaurants(params[:location], params[:category])
        restaurant_data_with_reviews = YelpApi.get_review_data(restaurant_data)
        restaurant_data_with_sentiment_score = YelpApi.add_sentiment_score(restaurant_data_with_reviews)
        render json: restaurant_data_with_sentiment_score.to_json
    end

    def restaurant 
        restaurant = JSON.parse(YelpApi.get_restaurant(params[:business_id]))
        byebug
        render json: restaurant
    end

    def restaurant_reviews
        reviews = JSON.parse(YelpApi.get_reviews(params[:business_id]))
        render json: reviews
    end

end
