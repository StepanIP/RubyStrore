class AddOnDeleteRestrictToCartItems < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :cart_items, :products
    add_foreign_key :cart_items, :products, on_delete: :restrict
  end
end