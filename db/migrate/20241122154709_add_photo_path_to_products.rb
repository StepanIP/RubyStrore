# db/migrate/20231101123456_add_photo_path_to_products.rb
class AddPhotoPathToProducts < ActiveRecord::Migration[6.1]
  def change
    add_column :products, :photo_path, :string
  end
end