Rails.application.routes.draw do
  root "itineraries#index"

  get("/users/:username", { :controller => "users", :action => "profile" })

  # Routes for the Bookmark resource:

  # CREATE
  #post("/insert_bookmark", { :controller => "bookmarks", :action => "create" })
          
  # READ
  # get("/bookmarks", { :controller => "bookmarks", :action => "index" })
  
  get("/bookmarks/:path_id", { :controller => "bookmarks", :action => "show" })
  
  # UPDATE
  # post("/modify_bookmark/:path_id", { :controller => "bookmarks", :action => "update" })
  
  # DELETE
  # get("/delete_bookmark/:path_id", { :controller => "bookmarks", :action => "destroy" })

  #------------------------------

  # Routes for the Like resource:

  # CREATE
  # post("/insert_like", { :controller => "likes", :action => "create" })
          
  # READ
  # get("/likes", { :controller => "likes", :action => "index" })
  
  get("/likes/:path_id", { :controller => "likes", :action => "show" })
  
  # UPDATE
  # post("/modify_like/:path_id", { :controller => "likes", :action => "update" })
  
  # DELETE
  # get("/delete_like/:path_id", { :controller => "likes", :action => "destroy" })

  #------------------------------

  # Routes for the Activity resource:

  # CREATE
  # post("/insert_activity", { :controller => "activities", :action => "create" })
          
  # READ
  get("/activities", { :controller => "activities", :action => "index" })
  # get("/activities/:path_id", { :controller => "activities", :action => "show" })
  
  # UPDATE
  
  post("/modify_activity/:path_id", { :controller => "activities", :action => "update" })
  
  # DELETE
  get("/delete_activity/:path_id", { :controller => "activities", :action => "destroy" })

  #------------------------------

  # Routes for the Itinerary resource:

  # CREATE
  post("/insert_itinerary", { :controller => "itineraries", :action => "create" })
          
  # READ
  get("/itineraries", { :controller => "itineraries", :action => "index" })
  
  get("/itineraries/:path_id", { :controller => "itineraries", :action => "show" })
  
  # UPDATE
  
  post("/modify_itinerary/:path_id", { :controller => "itineraries", :action => "update" })
  
  # DELETE
  get("/delete_itinerary/:path_id", { :controller => "itineraries", :action => "destroy" })

  #------------------------------

  devise_for :users
  
end
