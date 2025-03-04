# == Schema Information
#
# Table name: users
#
#  id                     :bigint           not null, primary key
#  avatar_url             :string
#  bookmarks_count        :integer
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  itineraries_count      :integer
#  likes_count            :integer
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  username               :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         validates(:username, {
    :presence => true,
    :uniqueness => { :case_sensitive => false },
  })

  validates(:email, {
    :presence => true,
    :uniqueness => { :case_sensitive => false },
  })

  # Association accessor methods to define:
  
  ## Direct associations

  # User#itineraries: returns rows from the itineraries table associated to this user by the itinerary_id column
  has_many(:itineraries, class_name: "Itinerary", foreign_key: "owner_id")

  # User#likes: returns rows from the likes table associated to this user by the fan_id column
  has_many(:likes, class_name: "Like", foreign_key: "fan_id")

  # User#bookmarks: returns rows from the bookmarks table associated to this user by the fan_id column
  has_many(:bookmarks, class_name: "Bookmark", foreign_key: "keen_id")

  # User#actvities: returns rows from the activities table associated to this user by the activities column
  has_many(:activities, class_name: "Activity", foreign_key: "traveller_id")

  ## Indirect associations

  # User#saved_activities: returns rows from the activities table associated to this user through its bookmarks
  has_many(:saved_activities, through: :bookmarks, source: :activities)

  # User#liked_itineraries: returns rows from the itineraries table associated to this user through its likes
  has_many(:liked_itineraries, through: :likes, source: :itineraries)

end
