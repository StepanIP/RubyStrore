# app/models/product.rb
class Product < ApplicationRecord
  has_many :reviews
  has_many :carts

  validates :category, presence: true
  validates :color, presence: true
  validates :product_type, presence: true
end