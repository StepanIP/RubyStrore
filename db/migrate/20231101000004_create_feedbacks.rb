# db/migrate/20231101000004_create_feedbacks.rb
class CreateFeedbacks < ActiveRecord::Migration[6.1]
  def change
    create_table :feedbacks do |t|
      t.references :user, null: false, foreign_key: true
      t.text :message

      t.timestamps
    end
  end
end# frozen_string_literal: true

