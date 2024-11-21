# app/controllers/orders_controller.rb
class OrdersController < ApplicationController
  def index
    @orders = OrderService.list_orders
    render json: @orders
  end

  def create
    @order = OrderService.create_order(order_params)
    if @order.save
      render json: @order, status: :created
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def update
    @order = OrderService.update_order(params[:id], order_params)
    if @order.save
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  def destroy
    OrderService.delete_order(params[:id])
    head :no_content
  end

  private

  def order_params
    params.require(:order).permit(:user_id, :delivery_option_id, :total_price)
  end
end