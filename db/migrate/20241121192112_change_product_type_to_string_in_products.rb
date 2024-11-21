# db/migrate/XXXXXXXXXX_change_product_type_to_string_in_products.rb
class ChangeProductTypeToStringInProducts < ActiveRecord::Migration[6.1]
  def up
    change_column :products, :product_type, :string
  end

  def down
    change_column :products, :product_type, :integer
  end
end