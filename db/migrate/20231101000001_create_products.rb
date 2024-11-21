# db/migrate/20231101000001_create_products.rb
class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.decimal :price, precision: 10, scale: 2
      t.references :user, null: false, foreign_key: true
      t.timestamps
    end
  end
end