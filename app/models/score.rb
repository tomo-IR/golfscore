class Score < ApplicationRecord
    belongs_to :user, optional: true
end
