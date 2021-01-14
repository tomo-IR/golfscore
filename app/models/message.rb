class Message < ApplicationRecord
    belongs_to :user
    belongs_to :golfcourse
    validates :content, :presence => true, :length => { :maximum => 100 }
    has_many :likes
    has_many :liked_users, :through => :likes, :source => :user
    mount_uploader :image, ImageUploader
end
