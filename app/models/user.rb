# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  has_many :products
  has_many :reviews
  has_one :cart, dependent: :destroy
  has_many :feedbacks

  after_create :create_cart

  def create_cart
    Cart.create(user: self)
  end
end