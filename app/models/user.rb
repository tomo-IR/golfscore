class User < ApplicationRecord
  # before_save { self.email.downcase! }
  # validates :name, presence: true, length: { maximum: 50 }
  # validates :email, presence: true, length: { maximum: 255 },
  #                   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
  #                   uniqueness: { case_sensitive: false }
  has_secure_password

  has_many :messages, dependent: :destroy
  has_many :scores
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # validates :name, presence: {message: 'を入力してください'}
  
  #フォロー機能関係
  has_many :following_relationships, foreign_key: "follower_id", class_name: "Relationship", dependent: :destroy

 has_many :followings, through: :following_relationships

 has_many :follower_relationships, foreign_key: "following_id", class_name: "Relationship", dependent: :destroy

 has_many :followers, through: :follower_relationships

  def following?(other_user)
    following_relationships.find_by(following_id: other_user.id)
  end

  def follow!(other_user)
    following_relationships.create!(following_id: other_user.id)
  end

  def unfollow!(other_user)
    following_relationships.find_by(following_id: other_user.id).destroy
  end
end
