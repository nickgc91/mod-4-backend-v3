class ScoresController < ApplicationController

    def index 
        scores = User.all
        render json: scores
    end

    def create 
        score = Score.new(strong_params)

        if score.save
            render json: score, status: :created
          else
            render json: score.errors, status: :unprocessable_entity
          end
    end

    def show
        score = Score.find(params[:id])
        render json: score
    end

    private

    def strong_params
        params.require(:user).permit(:user_id, :runtime)
    end

end
