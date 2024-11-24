# app/controllers/home_controller.rb
class HomeController < ApplicationController
  def index
    @newest_products = Product.order(created_at: :desc).limit(10)
  end
end