class UsersController < ApplicationController

    def index 
        users = User.all
        render json: users
    end

    def create 
        user = User.new(strong_params)

        if user.save
            render json: user, status: :created
          else
            render json: user.errors, status: :unprocessable_entity
          end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    private

    def strong_params
        params.require(:user).permit(:username, :password_digest)
    end

end
