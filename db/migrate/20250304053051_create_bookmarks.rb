class CreateBookmarks < ActiveRecord::Migration[7.1]
  def change
    create_table :bookmarks do |t|
      t.integer :bookmarker_id
      t.integer :activity_id
      t.integer :itinerary_id

      t.timestamps
    end
  end
end
