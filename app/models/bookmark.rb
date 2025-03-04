# == Schema Information
#
# Table name: bookmarks
#
#  id            :bigint           not null, primary key
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  activity_id   :integer
#  bookmarker_id :integer
#  itinerary_id  :integer
#
class Bookmark < ApplicationRecord
  validates(:bookmarker, { :presence => true })
  validates(:activity, { :presence => true })
  validates(:activity_id, { 
    :uniqueness => { :scope => [:keen_id] }
  })
  
  ## Direct associations

  # Bookmark#bookmarker: returns a row from the users table associated to this like by the bookmarker_id column
  belongs_to(:bookmarker, class_name: "User", foreign_key = "bookmarker_id")

  # Bookmark#activity: returns a row from the activity table associated to this bookmark by the activity_id column
  belongs_to(:activity, class_name: "Activity", foreign_key = "activity_id")

  ## Indirect associations

  # Bookmark#itinerary: returns a row from the itinerary table associated to this bookmark by the itinerary_id column
  belongs_to(:itinerary, class_name: "Itinerary", foreign_key = "itinerary_id")
end
