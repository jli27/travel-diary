desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  if Rails.env.development?
    Activity.destroy_all
    Itinerary.destroy_all
    User.destroy_all
  end

  user1 = User.new
  user1.save
  user1.username = "Jasmine"
  user1.avatar_url = "https://static.wixstatic.com/media/f0bb90_f2ffa6cf499d467b87d71315d20f85a8~mv2.jpeg/v1/crop/x_118,y_469,w_748,h_749/fill/w_170,h_170,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/Jasmine.jpeg"
  user1.itineraries_count = 0
  user1.itineraries_count = 0
  user1.bookmarks_count = 0
  user1.likes_count = 0
  user1.email = "jasmine@example.com"
  user1.encrypted_password = "jasmine"
  user1.save

  user2 = User.new
  user2.avatar_url = "https://lirp.cdn-website.com/d5f03950/dms3rep/multi/opt/Madelyn_senior_photo2-640w.png"
  user2.itineraries_count = 0
  user2.itineraries_count = 0
  user2.bookmarks_count = 0
  user2.likes_count = 0
  user2.email = "madelyn@example.com"
  user2.encrypted_password = "madelyn"
  user2.save

  users = User.all
  p "Added #{User.count} Users"

  itinerary = Itinerary.new
  itinerary.name = "Lisbon"
  itinerary.caption = "My Lisbon itinerary"
  itinerary.cover_image = "https://i0.wp.com/jordangassner.com/wp-content/uploads/2023/06/Portugal-Lisbon-Fronteira-Gardens-3.jpg?resize=1080%2C1620&ssl=1"
  itinerary.likes_count = 0
  itinerary.bookmarks_count = 0
  itinerary.activities_count = 0
  itinerary.owner_id = user1.id
  user1.itineraries_count += 1
  user1.save
  itinerary.save

  itinerary2 = Itinerary.new
  itinerary2.name = "Cancun"
  itinerary2.caption = "My Cancun itinerary"
  itinerary2.cover_image = "https://dynamic-media-cdn.tripadvisor.com/media/photo-o/0f/c3/79/cc/xcaret.jpg?w=1200&h=-1&s=1"
  itinerary2.likes_count = 0
  itinerary2.activities_count = 0
  itinerary2.bookmarks_count = 0
  itinerary2.owner_id = user2.id
  user2.itineraries_count += 1
  user2.save
  itinerary2.save

  p "Added #{Itinerary.count} Itineraries"
  itineraries = Itinerary.all

  activity = Activity.new
  activity.name = "Taberna Sal Grosso"
  activity.description = "Lunch!"
  activity.cover_image = "https://images.culinarybackstreets.com/wp-content/uploads/cb_lisbon_tabernasalgrossoupdate_jcc_final_interior.jpg?lossy=1&resize=800%2C533&ssl=1"
  activity.bookmarks_count = 0
  activity.location = "Lisbon"
  activity.rating = 5
  activity.itinerary_id = itinerary.id
  activity.traveller_id = itinerary.owner_id
  new_date = Date.new(2024,3,18)
  activity.date = new_date
  new_time = Time.parse("14:00")
  activity.time = new_time
  itinerary.activities_count += 1
  itinerary.save
  activity.save

  activity2 = Activity.new
  activity2.name = "Mandala Beach Club"
  activity2.description = "Two Friends Party"
  activity2.cover_image = "https://i0.wp.com/discotech.me/wp-content/uploads/2019/05/mandalabanner.jpg?resize=1500%2C630&ssl=1"
  activity2.bookmarks_count = 0
  activity2.location = "https://g.co/kgs/vbdfhMn"
  activity2.rating = 3
  activity2.location = "Cancun"
  activity2.itinerary_id = itinerary2.id
  activity2.traveller_id = itinerary2.owner_id
  new_date2 = Date.new(2023,3,11)
  activity2.date = new_date
  new_time2 = Time.parse("12:00")
  activity2.time = new_time
  itinerary2.activities_count += 1
  itinerary2.save
  activity2.save

  p "Added #{Activity.count} Activities"
  all_activities = Activity.all
end
