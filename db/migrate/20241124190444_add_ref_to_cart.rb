class AddRefToCart < ActiveRecord::Migration[8.0]
  def change
    add_reference :carts, :cart_item, foreign_key: true
  end
end
