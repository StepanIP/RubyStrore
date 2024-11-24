class CartsController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i
    cart = current_user.carts

    cart_item = cart.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity += quantity
    cart_item.save

    flash[:notice] = "#{product.name} has been added to your cart."

    redirect_to product_path(product)
  end

  def show
    @cart_items = current_user.cart.cart_items.includes(:product)
  end
end