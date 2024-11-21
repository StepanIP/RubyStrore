# app/models/delivery_option.rb
class DeliveryOption < ApplicationRecord
  has_many :orders
end