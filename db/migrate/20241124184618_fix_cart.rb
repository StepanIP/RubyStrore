class FixCart < ActiveRecord::Migration[8.0]
  def change
    remove_reference :carts, :product, foreign_key: true

    create_table :cart_items do |t|
      t.references :cart, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.integer :quantity, null: false, default: 1

      t.timestamps
    end
  end
end
