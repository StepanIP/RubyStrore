# db/migrate/XXXXXXXXXX_remove_user_id_from_products.rb
class RemoveUserIdFromProducts < ActiveRecord::Migration[6.1]
  def change
    remove_reference :products, :user, foreign_key: true
  end
end