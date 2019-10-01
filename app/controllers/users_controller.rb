class UsersController < ApplicationController

    def index 
        users = User.all
        render json: 
        users.map { |user|
            { playerTotal: User.all.length, user: {id: user.id,
                username: user.username,
                highScore: user.getHighScore(user.scores)}
                }
            }
    end

    def signin
        user = User.find_by(username: params[:username])

        if user and user.authenticate(params[:password])
            render json: user
        else
            render json: { error: 'Username/password combniation invalid!' }, status: 401 
        end
    end


    def createUser
        user = User.new(username: params[:username], password: params[:password])
        
        # byebug
        if user.save
            render json: user, status: :created
            score = Score.create(user_id: user.id, runtime: 1000)
        else
            render json: { user_errors: user.errors.full_messages }, status: :unprocessable_entity
        end 
    end



    def save_game 
        #we'll have to create an option to either create new user or if user already exists match user
        #to an account
        user = User.find_by(username: score_params[:username])
        if user.scores[0].runtime == 1000
            score = Score.find_by(user_id: user.id)
            score.update(user_id: user.id, runtime: score_params[:highScore])
            render json: score, status: :created
        elsif user.scores[0].runtime != 1000
            Score.create(user_id: user.id, runtime: score_params[:highScore])
            render json: score, status: :created
        else
            render json: { user_errors: user.errors.full_messages, score_errors: score.errors.full_messages }, status: :unprocessable_entity
          end
    end

    def show
        user = User.find(params[:id])
        render json: user
    end

    private

    def score_params
        params.require(:user).permit(:username, :highScore)
    end

end
