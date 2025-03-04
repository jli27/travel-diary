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
end
