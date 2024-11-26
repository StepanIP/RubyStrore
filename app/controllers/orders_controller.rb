# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def create
    order = Order.create(order_params.merge(user: current_user))
    current_user.cart.cart_items.each do |cart_item|
      order.order_items.create(product: cart_item.product, quantity: cart_item.quantity)
    end
    current_user.cart.cart_items.destroy_all
    redirect_to account_path(order), notice: 'Order placed successfully!'
  end

  private

  def order_params
    params.require(:order).permit(:delivery_option, :total_price, order_items_attributes: [:product_id, :quantity])
  end
end