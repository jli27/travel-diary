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
end
