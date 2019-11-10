class UsersController < ApplicationController

    def saved_restaurants
        user = User.find(params[:id])
        restaurant_data = user.restaurants.map{ |restaurant| JSON.parse(YelpApi.get_restaurant(restaurant.yelp_business_id)) }
        render json: {saved_restaurants: restaurant_data}
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

end
