# app/controllers/products_controller.rb
class ProductsController < ApplicationController
  def index
    @products = ProductService.list_products
    render json: @products
  end

  def create
    @product = ProductService.create_product(product_params)
    if @product.save
      render json: @product, status: :created
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def update
    @product = ProductService.update_product(params[:id], product_params)
    if @product.save
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  def destroy
    ProductService.delete_product(params[:id])
    head :no_content
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, :user_id, :product_type, :category, :color)
  end
end