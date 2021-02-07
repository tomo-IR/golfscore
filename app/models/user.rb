class User < ApplicationRecord
  # has_secure_password

  validates :email, :presence => true 
  validates :email, :uniqueness => true
  validates :name, :uniqueness => true, :presence => true 

  mount_uploader :avatar, AvatarUploader

  has_many :messages, dependent: :destroy
  has_many :scores, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  
  #フォロー機能関係
  has_many :following_relationships, :foreign_key => "follower_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followings, :through => :following_relationships
  has_many :follower_relationships, :foreign_key => "following_id", :class_name => "Relationship", :dependent => :destroy
  has_many :followers, :through => :follower_relationships

  def following?(other_user)
    following_relationships.find_by(:following_id => other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(:following_id => other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(:following_id => other_user.id).destroy
  end

  #いいね関係
  has_many :likes, :dependent => :destroy
  has_many :liked_messages, :through => :likes, :source => :message
  def already_liked?(message)
    self.likes.exists?(:message_id => message.id)
  end
  def self.guest
    find_or_create_by!(:email => 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.name = "ゲストプレイヤー"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
    end
  end

  def self.search(search)
      return User.all unless search
      User.where(['name LIKE ?', "%#{search}%"])
  end
 
end
