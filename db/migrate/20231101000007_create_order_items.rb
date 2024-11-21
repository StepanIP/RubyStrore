# db/migrate/20231101000007_create_order_items.rb
class CreateOrderItems < ActiveRecord::Migration[6.1]
  def change
    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, default: 1
      t.decimal :price, precision: 10, scale: 2
      t.timestamps
    end
  end
end