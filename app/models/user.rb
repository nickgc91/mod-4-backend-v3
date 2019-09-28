class User < ApplicationRecord
    has_many :scores
    has_secure_password

    def getHighScore(scores)
        myHighScore = scores.min_by{|score| score.runtime}
        return myHighScore.runtime
    end
end
