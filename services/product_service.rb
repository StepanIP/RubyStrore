# app/services/product_service.rb
class ProductService
  def self.create_product(params)
    Product.create(params)
  end

  def self.update_product(id, params)
    product = Product.find(id)
    product.update(params)
    product
  end

  def self.delete_product(id)
    Product.find(id).destroy
  end

  def self.list_products
    Product.all
  end
end