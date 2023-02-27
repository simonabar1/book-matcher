class User < ApplicationRecord
  has_and_belongs_to_many :books, join_table: :books_users

  validates :email, presence: true, uniqueness: true
  validates :nickname, presence: true, uniqueness: true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def read_books
    books.where('books_users.read = ?', true)
  end

end
