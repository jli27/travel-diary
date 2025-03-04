class CreateItineraries < ActiveRecord::Migration[7.1]
  def change
    create_table :itineraries do |t|
      t.string :name
      t.string :caption
      t.string :cover_image
      t.integer :likes_count
      t.integer :bookmarks_count
      t.integer :activities_count
      t.integer :owner_id
      t.string :location

      t.timestamps
    end
  end
end
