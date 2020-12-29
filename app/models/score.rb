class Score < ApplicationRecord
    belongs_to :user, :optional => true
    # validates :hole_score, presence: true, numericality: { only_integer: true }
    #view側でバリデーションするので、モデル側はなし
end
