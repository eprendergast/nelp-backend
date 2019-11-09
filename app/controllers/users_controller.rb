class UsersController < ApplicationController

    def saved_restaurants
        user = User.find(params[:id])
        saved_restaurants = get_users_saved_restaurants(params[:id])
        saved_restaurant_business_ids = saved_restaurants.map{ |restaurant| restaurant.yelp_business_id }

        saved_restaurant_data = saved_restaurant_business_ids.map{ |business_id| JSON.parse(YelpApi.get_restaurant(business_id)) }
        render json: {restaurants: saved_restaurant_data}

    end


    # ACCOUNT CRUD

    def index
        users = User.all 
        render json: {users: users}
    end

    def show 
        user = User.find(params[:id])
        render json: {user: user}
    end

    def create
        user = User.new(JSON.parse(params["body"]))
        if user.valid? 
            user.save
            render json: { first_name: user.first_name }
        else
            render json: { error:  'User details not valid' }
        end
    end

    def update
       
    end

    def destroy

    end

    # AUTHENTICATION

    def signin
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            token = issue_token({id: user.id})
            render json: { first_name: user.first_name, token: token }
        else
            render json: { error:  'Email and password combination is invalid.' }, status: 401
        end
    end

    def validate
        user = get_current_user
        if user
          render json: { username: user.username, token: issue_token({ id: user.id }) }
        else
          render json: { error:  'Unable to validate user.' }, status: 401
        end
    end

    private 
    
    def get_users_saved_restaurants(id)
        UserRestaurant.all.select{ |user_restaurant| user_restaurant.user_id == params[:id].to_i }.map{ |user_restaurant| user_restaurant.restaurant }
    end

end
