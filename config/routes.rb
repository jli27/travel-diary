Rails.application.routes.draw do
  # Routes for the Activity resource:

  # CREATE
  post("/insert_activity", { :controller => "activities", :action => "create" })
          
  # READ
  get("/activities", { :controller => "activities", :action => "index" })
  
  get("/activities/:path_id", { :controller => "activities", :action => "show" })
  
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

  # This is a blank app! Pick your first screen, build out the RCAV, and go from there. E.g.:

  # get "/your_first_screen" => "pages#first"
  
end
