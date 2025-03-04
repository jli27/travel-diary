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
end
