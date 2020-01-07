class CreateSpots < ActiveRecord::Migration[5.2]
  def change
    create_table :spots do |t|
      t.string :name
      t.string :spot_image
      t.text :content
      t.string :area
      t.string :address
      t.string :open_hour
      t.string :admission
      t.string :holiday

      t.timestamps
    end
  end
end
