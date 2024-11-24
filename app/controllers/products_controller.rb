# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    @categories = Product.select(:category).distinct
    @products = Product.all

    @products = Product.paginate(page: params[:page], per_page: 3)

    if params[:search].present?
      @products = @products.where('name LIKE ?', "%#{params[:search]}%")
    end

    if params[:category].present?
      @products = @products.where(category: params[:category])
    end

  end

  def show
    @product = Product.find(params[:id])
  end
end