# == Schema Information
#
# Table name: itineraries
#
#  id               :bigint           not null, primary key
#  activities_count :integer
#  bookmarks_count  :integer
#  caption          :string
#  cover_image      :string
#  likes_count      :integer
#  location         :string
#  name             :string
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  owner_id         :integer
#
class Itinerary < ApplicationRecord
  validates(:poster, { :presence => true })

  # Association accessor methods to define:
  
  ## Direct associations

  # Itinerary#poster: returns a row from the users table associated to this itinerary by the owner_id column
  belongs_to(:poster, class_name: "User", foreign_key: "owner_id")

  # Itinerary#activities: returns rows from the activity table associated to this itinerary by the itinerary_id column
  has_many(:activities, class_name: "Activity", foreign_key: "itinerary_id")

  # Itinerary#likes: returns rows from the likes table associated to this itinerary by the itinerary_id column
  has_many(:likes, class_name: "Like", foreign_key: "itinerary_id")

  ## Indirect associations

  # Itinerary#fans: returns rows from the users table associated to this Itinerary through its likes
  has_many(:fans, through: :likes, source: :fan)
  
  # Itinerary#bookmarker: returns rows from the users table associated to this Itinerary through its bookmarks
  has_many(:bookmarker, through: :bookmarks, source: :bookmarkers)
end
