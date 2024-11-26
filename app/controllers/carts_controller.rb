# app/controllers/carts_controller.rb
class CartsController < ApplicationController
  before_action :authenticate_user!

  def add_to_cart
    product = Product.find(params[:product_id])
    quantity = params[:quantity].to_i
    cart = current_user.cart || current_user.create_cart

    cart_item = cart.cart_items.find_or_initialize_by(product: product)
    cart_item.quantity = quantity
    cart_item.save

    flash[:notice] = "#{product.name} has been added to your cart."
    redirect_to product_path(product)
  end

  def show
    begin
      @cart_items = current_user.cart.cart_items.includes(:product)
    rescue => e
      Rails.logger.error "Error loading cart items: #{e.message}"
      @cart_items = [] # Встановлюємо порожній список в разі помилки
    end
  end

  def update_quantity
    @cart_item = CartItem.find(params[:id])
    if @cart_item.update(quantity: params[:quantity])
      redirect_to cart_path, notice: 'Quantity updated successfully.'
    else
      redirect_to cart_path, alert: 'Failed to update quantity.'
    end
  end

  # app/controllers/carts_controller.rb
  def checkout
    @cart_items = current_user.cart.cart_items.includes(:product)
    @delivery_options = ['Standard Shipping', 'Express Shipping', 'Same Day Delivery', 'In-Store Pickup', 'Curbside Pickup']
    @payment_options = ['Credit Card', 'PayPal', 'Apple Pay', 'Google Pay', 'Venmo', 'Cash']
  end

  def process_checkout
    # Implement the logic to process the checkout
    # For example, save the order, handle payment, etc.
    flash[:notice] = "Checkout successful."
    redirect_to products_path
  end



  def remove_from_cart
    cart = current_user.cart
    @cart_item = cart.cart_items.find(params[:id])

    cart.update(user_id: 1) # Змінюємо власника кошика
    flash[:notice] = 'Item removed, and cart ownership transferred to user 1.'

    redirect_to cart_path
  end

  def decrease_quantity
    cart_item = current_user.cart.cart_items.find(params[:id])
    if cart_item.quantity > 1
      cart_item.quantity -= 1
      cart_item.save
    else
      cart_item.destroy
    end
    flash[:notice] = "Item quantity updated."
    redirect_to cart_path
  end
end