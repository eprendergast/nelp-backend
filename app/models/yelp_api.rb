class YelpApi < ApplicationRecord

    API_ENDPOINT = "https://api.yelp.com/v3"
    SEARCH_URL = "#{API_ENDPOINT}/businesses/search"

    def self.get_restaurants(location = "london", category = "all")
        return Unirest.get( 
            SEARCH_URL, 
            headers: {
                "Accept" => "application/json",
                "Authorization" => "Bearer #{ENV["API_KEY"]}"
            },
            parameters: {
                :location => location,
                :term => "restaurants",
                :categories => category,
                :limit => 10 #can be up to 50; setting to 10 for development
            }
        ).raw_body
    end

    def self.get_restaurant(business_id)
        business_url = generate_business_url(business_id)
        return Unirest.get( 
            business_url, 
            headers: {
                "Accept" => "application/json",
                "Authorization" => "Bearer #{ENV["API_KEY"]}"
            }
        ).raw_body
    end

    def self.get_reviews(business_id)
        reviews_url = generate_reviews_url(business_id)
        return Unirest.get( 
            reviews_url, 
            headers: {
                "Accept" => "application/json",
                "Authorization" => "Bearer #{ENV["API_KEY"]}"
            }
        ).raw_body
    end

    def self.generate_business_url(business_id)
        "#{API_ENDPOINT}/businesses/#{business_id}"
    end

    def self.generate_reviews_url(business_id)
        "#{YelpApi.generate_business_url(business_id)}/reviews"
    end

end
