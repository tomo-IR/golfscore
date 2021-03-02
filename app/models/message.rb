class Message < ApplicationRecord
	belongs_to :user
	belongs_to :golfcourse
	validates :content, :length => { :maximum => 100 }
	has_many :likes, dependent: :destroy
	has_many :liked_users, :through => :likes, :source => :user
	mount_uploader :image, ImageUploader
	validates :content_or_image, presence: true

	private
    def content_or_image
      content.presence or image.presence
    end
end
