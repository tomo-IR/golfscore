class Score < ApplicationRecord
    belongs_to :user, :optional => true
    belongs_to :golfcourse
    # validates :golfcourse_id, presence: true, numericality: { only_integer: true }
    #view側でバリデーションするので、モデル側はなし
end
