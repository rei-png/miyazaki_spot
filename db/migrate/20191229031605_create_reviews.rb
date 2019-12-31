class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.string :title
      t.float :review_star
      t.text :content
      t.string :image
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
