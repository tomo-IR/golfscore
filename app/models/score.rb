class Score < ApplicationRecord
  belongs_to :user, :optional => true
  belongs_to :golfcourse
end
