class AddOnDeleteRestrictToCarts < ActiveRecord::Migration[6.0]
  def change
    remove_foreign_key :carts, :users
    add_foreign_key :carts, :users, on_delete: :restrict
  end
end