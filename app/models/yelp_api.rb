class YelpApi < ApplicationRecord

    # "oK_SLmmAVQg3meguh7LrIA"

    API_KEY = "Q_MKhGJKICh6pddiZIwjIbTTRZBxinR4-GP7xS_Tr6DINyFLAoI11koN7lszLvdKAatcitwFG33E9v8O0UXGApFR5fprBFBtIOv3u77WL0oYZecNNEUnbR06b4LEXXYx"
    API_ENDPOINT = "https://api.yelp.com/v3"
    SEARCH_URL = "#{API_ENDPOINT}/businesses/search"

    def get_business_id(id)

    end

    def self.generate_business_url(business_id)
        "#{API_ENDPOINT}/businesses/#{business_id}"
    end

    def self.generate_reviews_url(business_id)
        "#{YelpApi.generateBusinessUrl(business_id)}/reviews"
    end

    def self.get_restaurants(location = "london", category = "all")
        return Unirest.get( 
            SEARCH_URL, 
            headers: {
                "Accept" => "application/json",
                "Authorization" => "Bearer #{API_KEY}"
            },
            parameters: {
                :location => location,
                :term => "restaurants",
                :categories => category,
                :limit => 50
            }
        ).raw_body
    end

    def self.get_restaurant(business_id)
        business_url = self.generateBusinessUrl(business_id)
        return Unirest.get( 
            business_url, 
            headers: {
                "Accept" => "application/json",
                "Authorization" => "Bearer #{API_KEY}"
            }
        ).raw_body
    end

end
