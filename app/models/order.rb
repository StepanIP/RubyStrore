# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :user
  has_many :order_items

  validates :delivery_option, presence: true
end