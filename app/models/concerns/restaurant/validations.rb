module Restaurant::Validations
    extend ActiveSupport::Concern

    included do 
        validates :yelp_business_id, presence: true
    end

end