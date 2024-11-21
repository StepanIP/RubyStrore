# app/services/order_service.rb
class OrderService
  def self.create_order(params)
    Order.create(params)
  end

  def self.update_order(id, params)
    order = Order.find(id)
    order.update(params)
    order
  end

  def self.delete_order(id)
    Order.find(id).destroy
  end

  def self.list_orders
    Order.all
  end
end