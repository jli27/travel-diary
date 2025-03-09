class LikesController < ApplicationController
  def index
    matching_likes = Like.all

    @list_of_likes = matching_likes.order({ :created_at => :desc })

    render({ :template => "likes/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_likes = Like.where({ :id => the_id })

    @the_like = matching_likes.at(0)

    render({ :template => "likes/show" })
  end

  def create
    the_like = Like.new
    the_like.fan_id = current_user.id
    iten = params.fetch("iten")
    the_like.itinerary_id = iten
    matching_itinerary = Itinerary.where({ :id => iten }).at(0)
    matching_itinerary.likes_count += 1
    matching_itinerary.save

    if the_like.valid?
      the_like.save
      redirect_to("/itineraries/#{iten}", { :notice => "Like created successfully." })
    else
      redirect_to("/itineraries/#{iten}", { :alert => the_like.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_like = Like.where({ :id => the_id }).at(0)

    the_like.fan_id = params.fetch("query_fan_id")
    the_like.itinerary_id = params.fetch("query_itinerary_id")

    if the_like.valid?
      the_like.save
      redirect_to("/likes/#{the_like.id}", { :notice => "Like updated successfully."} )
    else
      redirect_to("/likes/#{the_like.id}", { :alert => the_like.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_like = Like.where({ :id => the_id }).at(0)

    the_like.destroy

    redirect_to("/likes", { :notice => "Like deleted successfully."} )
  end
end
