class AddUrlToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :url, :text
  end
end
