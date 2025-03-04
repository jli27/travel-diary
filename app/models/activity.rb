# == Schema Information
#
# Table name: activities
#
#  id              :bigint           not null, primary key
#  bookmarks_count :string
#  cover_image     :string
#  date            :date
#  description     :text
#  location        :string
#  name            :string
#  rating          :integer
#  time            :time
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  itinerary_id    :integer
#  traveller_id    :integer
#
class Activity < ApplicationRecord
  validates(:traveller, { :presence => true })

  # Association accessor methods to define:
  
  ## Direct associations

  # Activity#traveller: returns a row from the users table associated to this activity by the traveller_id column
  belongs_to(:traveller, class_name: "User", foreign_key: "traveller_id")

  # Activity#corresponding_itinerary: returns a row from the itinerary table associated to this activity by the itinerary_id column
  belongs_to(:corresponding_itinerary, class_name: "Itinerary", foreign_key: "itinerary_id")

  # Activity#bookmarks: returns rows from the bookmarks table associated to this activity by the activity_id column
  has_many(:bookmarks, class_name: "Bookmark", foreign_key: "activity_id")

  ## Indirect associations

  # Activity#bookmarkers: returns rows from the users table associated to this activity through its bookmarks
  has_many(:bookmarkers, through: :bookmarks, source: :bookmarks)
end
