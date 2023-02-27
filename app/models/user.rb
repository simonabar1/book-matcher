class User < ApplicationRecord
  has_and_belongs_to_many :books, join_table: :books_users

  has_many :followed_relationships, class_name: "Follow", foreign_key: "follower_id", dependent: :destroy
  has_many :followers, foreign_key: :follower_id, class_name: "Follower"

  has_many :follower_relationships, class_name: "Follow", foreign_key: "followed_id", dependent: :destroy
  has_many :followers, through: :follower_relationships, source: :follower


  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def read_books
    books.where('books_users.read = ?', true)
  end

  def follow(other_user)
    followed_relationships.create(followed_id: other_user.id)
  end

  def unfollow(other_user)
    followed_relationships.find_by(followed_id: other_user.id).destroy
  end

  def following?(other_user)
    followed_relationships.exists?(followed_id: other_user.id)
  end

end
