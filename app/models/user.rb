# app/models/user.rb
class User < ApplicationRecord
  has_secure_password
  has_many :products
  has_many :reviews
  has_many :carts
  has_many :feedbacks
end