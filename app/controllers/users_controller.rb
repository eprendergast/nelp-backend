class UsersController < ApplicationController

    def index
        users = User.all 
        render json: {users: users}
    end

    def create
        byebug
        user = User.new(user_params)
        if user.valid? 
            user.save
            render json: { first_name: user.first_name, token: issue_token({ id: user.id }) }
        else
            render json: { error:  'User details not valid' }
        end
    end

    def update
       user = User.find_by(params[:id])

    end

    def delete

    end

    private

    def user_params
        params.require(:user).permit(:first_name, :last_name, :email, :password)
    end


end
