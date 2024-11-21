# db/migrate/20231102000000_add_fields_to_products.rb
class AddFieldsToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :product_type, :integer, default: 0, null: false
    add_column :products, :category, :string, null: false
    add_column :products, :color, :string, null: false
  end
end