class AddSpotToReviews < ActiveRecord::Migration[5.2]
  def change
    add_reference :reviews, :spot, foreign_key: true
  end
end
