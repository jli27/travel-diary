class ItinerariesController < ApplicationController
  def index
    matching_itineraries = Itinerary.all

    @list_of_itineraries = matching_itineraries.order({ :created_at => :desc })

    render({ :template => "itineraries/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_itineraries = Itinerary.where({ :id => the_id })

    @the_itinerary = matching_itineraries.at(0)

    render({ :template => "itineraries/show" })
  end

  def create
    the_itinerary = Itinerary.new
    the_itinerary.name = params.fetch("query_name")
    the_itinerary.caption = params.fetch("query_caption")
    the_itinerary.cover_image = params.fetch("query_cover_image")
    the_itinerary.likes_count = params.fetch("query_likes_count")
    the_itinerary.bookmarks_count = params.fetch("query_bookmarks_count")
    the_itinerary.activities_count = params.fetch("query_activities_count")
    the_itinerary.owner_id = params.fetch("query_owner_id")
    the_itinerary.location = params.fetch("query_location")

    if the_itinerary.valid?
      the_itinerary.save
      redirect_to("/itineraries", { :notice => "Itinerary created successfully." })
    else
      redirect_to("/itineraries", { :alert => the_itinerary.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_itinerary = Itinerary.where({ :id => the_id }).at(0)

    the_itinerary.name = params.fetch("query_name")
    the_itinerary.caption = params.fetch("query_caption")
    the_itinerary.cover_image = params.fetch("query_cover_image")
    the_itinerary.likes_count = params.fetch("query_likes_count")
    the_itinerary.bookmarks_count = params.fetch("query_bookmarks_count")
    the_itinerary.activities_count = params.fetch("query_activities_count")
    the_itinerary.owner_id = params.fetch("query_owner_id")
    the_itinerary.location = params.fetch("query_location")

    if the_itinerary.valid?
      the_itinerary.save
      redirect_to("/itineraries/#{the_itinerary.id}", { :notice => "Itinerary updated successfully."} )
    else
      redirect_to("/itineraries/#{the_itinerary.id}", { :alert => the_itinerary.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_itinerary = Itinerary.where({ :id => the_id }).at(0)

    the_itinerary.destroy

    redirect_to("/itineraries", { :notice => "Itinerary deleted successfully."} )
  end
end
