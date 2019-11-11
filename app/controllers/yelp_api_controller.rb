class YelpApiController < ApplicationController

    def restaurants
        restaurant_data = YelpApi.get_restaurants(params[:location], params[:category])
        restaurant_data_with_reviews = YelpApi.get_review_data(restaurant_data)
        restaurant_data_with_sentiment_score = SentimentAnalyser.add_sentiment_score(restaurant_data_with_reviews)
        render json: restaurant_data_with_sentiment_score.to_json
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
