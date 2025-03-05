class ActivitiesController < ApplicationController

  def create
    the_activity = Activity.new
    the_activity.name = params.fetch("query_name")
    the_activity.description = params.fetch("query_description")
    the_activity.cover_image = params.fetch("query_cover_image")
    the_activity.bookmarks_count = params.fetch("query_bookmarks_count")
    the_activity.location = params.fetch("query_location")
    the_activity.rating = params.fetch("query_rating")
    the_activity.itinerary_id = params.fetch("query_itinerary_id")
    the_activity.traveller_id = params.fetch("query_traveller_id")
    the_activity.date = params.fetch("query_date")
    the_activity.time = params.fetch("query_time")

    if the_activity.valid?
      the_activity.save
      redirect_to("/itineraries/#{the_activity.itinerary_id}", { :notice => "Activity created successfully." })
    else
      redirect_to("/itineraries/#{the_activity.itinerary_id}", { :alert => the_activity.errors.full_messages.to_sentence })
    end
    
    the_itin = Itinerary.where({ :id => the_activity.itinerary_id }).at(0)
    the_itin.activities_count += 1
    the_itin.save
  end

  def update
    the_id = params.fetch("path_id")
    the_activity = Activity.where({ :id => the_id }).at(0)

    the_activity.name = params.fetch("query_name")
    the_activity.description = params.fetch("query_description")
    the_activity.cover_image = params.fetch("query_cover_image")
    the_activity.bookmarks_count = params.fetch("query_bookmarks_count")
    the_activity.location = params.fetch("query_location")
    the_activity.rating = params.fetch("query_rating")
    the_activity.itinerary_id = params.fetch("query_itinerary_id")
    the_activity.traveller_id = params.fetch("query_traveller_id")
    the_activity.date = params.fetch("query_date")
    the_activity.time = params.fetch("query_time")

    if the_activity.valid?
      the_activity.save
      redirect_to("/itineraries/#{the_activity.itinerary_id}", { :notice => "Activity updated successfully."} )
    else
      redirect_to("/itineraries/#{the_activity.itinerary_id}", { :alert => the_activity.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_activity = Activity.where({ :id => the_id }).at(0)

    the_itin = Itinerary.where({ :id => the_activity.itinerary_id }).at(0)
    count = the_itin.activities_count - 1
    the_itin.activities_count = count
    the_itin.save

    the_activity.destroy

    redirect_to("/itineraries/#{the_itin.id}", { :notice => "Activity deleted successfully."} )
  end
end
