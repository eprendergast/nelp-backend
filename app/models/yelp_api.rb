class YelpApi < ApplicationRecord

    API_KEY = "Q_MKhGJKICh6pddiZIwjIbTTRZBxinR4-GP7xS_Tr6DINyFLAoI11koN7lszLvdKAatcitwFG33E9v8O0UXGApFR5fprBFBtIOv3u77WL0oYZecNNEUnbR06b4LEXXYx"

    API_ENDPOINT = "https://api.yelp.com/v3"
    SEARCH_URL = "#{API_ENDPOINT}/businesses/search"

    reviews = "https://api.yelp.com/v3/businesses/{id}/reviews"

    def self.generateReviewsUrl(business_id)
        "#{API_ENDPOINT}/businesses/#{business_id}/reviews"
    end

    def self.getRestaurants 
        return Unirest.get( 
            SEARCH_URL, 
            headers: {
                "Accept" => "application/json",
                "Authorization" => "Bearer #{API_KEY}"
            },
            parameters: {
                :location => "London",
                :categories => "restaurants"
            }
        ).raw_body
    end

end
