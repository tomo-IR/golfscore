class Golfcourse < ApplicationRecord
    has_many  :scores
    def self.search(search)
        return Golfcourse.all unless search
        Golfcourse.where(['golfcoursename LIKE ?', "%#{search}%"])
      end
end
