# db/migrate/20231101000006_create_orders.rb
class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.references :delivery_option, null: false, foreign_key: true
      t.decimal :total_price, precision: 10, scale: 2

      t.timestamps
    end
  end
end