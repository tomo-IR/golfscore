class Golfcourse < ApplicationRecord
  has_many :scores, dependent: :destroy
  has_many :messages, dependent: :destroy
  def self.search(search)
    return Golfcourse.all unless search
    Golfcourse.where(['golfcoursename LIKE ?', "%#{search}%"])
  end
end
