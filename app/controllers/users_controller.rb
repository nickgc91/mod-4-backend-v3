class UsersController < ApplicationController

    def index 
        users = User.all
        render json: 
        users.map { |user|
            { playerTotal: User.all.length, user: {id: user.id,
                username: user.username,
               password_digest: user.password_digest,
                highScore: user.getHighScore(user.scores)}
                }
            }
    end

    def save_game 
        user = User.new(user_params)
        score = Score.new(user: user, runtime: score_params[:highScore])

        if user.save and score.save
            render json: user, status: :created
          else
            render json: { user_errors: user.errors.full_messages, score_errors: score.errors.full_messages }, status: :unprocessable_entity
          end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    private

    def user_params
        params.require(:user).permit(:username, :password)
    end

    def score_params
        params.require(:user).permit(:highScore)
    end

end
