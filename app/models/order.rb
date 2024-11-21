# app/models/order.rb
class Order < ApplicationRecord
  belongs_to :user
  belongs_to :delivery_option
  has_many :order_items
end