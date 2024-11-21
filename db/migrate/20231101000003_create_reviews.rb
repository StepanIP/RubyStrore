# db/migrate/20231101000003_create_reviews.rb
class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.references :user, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.text :content
      t.integer :rating
      t.timestamps
    end
  end
end