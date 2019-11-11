class SentimentAnalyser < ApplicationRecord

    def self.add_sentiment_score(restaurant_data_with_reviews)
        analyzer = Sentimental.new
        analyzer.load_defaults
        analyzer.threshold = 0.0

        return restaurant_data_with_reviews.map do |restaurant|
            restaurant.merge(
                "reviews": restaurant[:reviews].map{ |review| review.merge("sentiment_score": (analyzer.score review["text"])) }
            )
        end

    end

end
