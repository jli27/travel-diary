class CreateActivities < ActiveRecord::Migration[7.1]
  def change
    create_table :activities do |t|
      t.string :name
      t.text :description
      t.string :cover_image
      t.string :bookmarks_count
      t.string :location
      t.integer :rating
      t.integer :itinerary_id
      t.integer :traveller_id
      t.date :date
      t.time :time

      t.timestamps
    end
  end
end
