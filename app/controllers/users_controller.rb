class UsersController < ApplicationController

    def index 
        users = User.all
        render json: users.map { |user|
            { playerTotal: User.all.length, user: {id: user.id,
                username: user.username,
                password_digest: user.password_digest,
                highScore: user.getHighScore(user.scores)}
                }
            }
            
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
