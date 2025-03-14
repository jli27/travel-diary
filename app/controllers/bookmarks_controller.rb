class BookmarksController < ApplicationController
  def index
    matching_bookmarks = Bookmark.all

    @list_of_bookmarks = matching_bookmarks.order({ :created_at => :desc })

    render({ :template => "bookmarks/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_bookmarks = Bookmark.where({ :id => the_id })

    @the_bookmark = matching_bookmarks.at(0)

    render({ :template => "bookmarks/show" })
  end

  def create
    the_bookmark = Bookmark.new
    the_bookmark.bookmarker_id = current_user.id
    the_bookmark.activity_id = params.fetch("act")
    act = Activity.where({ :id => params.fetch("act") }).at(0)
    act.bookmarks_count = (act.bookmarks_count.to_i + 1).to_s
    act.save
    the_bookmark.itinerary_id = act.itinerary_id
    matching_iten = Itinerary.where({ :id => the_bookmark.itinerary_id}).at(0)
    matching_iten.bookmarks_count += 1
    matching_iten.save

    if the_bookmark.valid?
      the_bookmark.save
      redirect_to("/itineraries/#{act.itinerary_id}", { :notice => "Bookmark created successfully." })
    else
      redirect_to("/itineraries/#{act.itinerary_id}", { :alert => the_bookmark.errors.full_messages.to_sentence })
    end
  end

  def destroy
    act = params.fetch("act")
    matching_bookmark = Bookmark.where({ :bookmarker_id => current_user.id }, { :activity_id => act}).at(0)
    matching_act = Activity.where({ :id => matching_bookmark.activity_id }).at(0)
    matching_act.bookmarks_count = (matching_act.bookmarks_count.to_i - 1).to_s
    iten = matching_bookmark.itinerary_id
    matching_iten = Itinerary.where({ :id => iten}).at(0)
    count = matching_iten.bookmarks_count
    matching_iten.bookmarks_count = count - 1
    matching_iten.save
    matching_act.save

    matching_bookmark.destroy

    redirect_to("/itineraries/#{iten}", { :notice => "Bookmark deleted successfully."} )
  end
end
