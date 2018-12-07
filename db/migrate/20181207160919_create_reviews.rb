class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.references :product, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.text :description
      t.integer :rating
      t.text :user_name
      t.timestamps null: false
    end
  end
end
