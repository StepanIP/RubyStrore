# db/migrate/20231101000005_create_delivery_options.rb
class CreateDeliveryOptions < ActiveRecord::Migration[6.1]
  def change
    create_table :delivery_options do |t|
      t.string :name
      t.decimal :price, precision: 10, scale: 2

      t.timestamps
    end
  end
end# frozen_string_literal: true

