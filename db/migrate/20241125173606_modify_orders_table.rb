# db/migrate/20231101000007_modify_orders_table.rb
class ModifyOrdersTable < ActiveRecord::Migration[6.1]
  def change
    remove_reference :orders, :delivery_option, foreign_key: true
    add_column :orders, :delivery_option, :string, null: false


    create_table :order_items do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, default: 1

      t.timestamps
    end
  end
end