class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.text :body
      t.string :title
      t.integer :rating
      t.references :product, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
