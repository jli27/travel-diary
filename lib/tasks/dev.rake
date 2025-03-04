desc "Fill the database tables with some sample data"
task({ :sample_data => :environment }) do

  if Rails.env.development?
    Activity.destroy_all
    Itinerary.destroy_all
    User.destroy_all
    Like.destroy_all
    Bookmark.destroy_all
  end

  users = [
    {id: 1, username: "Jasmine", avatar_url: "https://static.wixstatic.com/media/f0bb90_f2ffa6cf499d467b87d71315d20f85a8~mv2.jpeg/v1/crop/x_118,y_469,w_748,h_749/fill/w_170,h_170,al_c,q_80,usm_0.66_1.00_0.01,enc_avif,quality_auto/Jasmine.jpeg", likes_count: 0, itineraries_count: 0, bookmarks_count: 0, email: "jasmine@example.com"},
    {id: 2, username: "Madelyn", avatar_url: "https://lirp.cdn-website.com/d5f03950/dms3rep/multi/opt/Madelyn_senior_photo2-640w.png", likes_count: 0, itineraries_count: 0, bookmarks_count: 0, email: "madelyn@example.com"}
  ]
  User.insert_all!(users)

  if User.method_defined?(:password) || User.has_attribute?(:password_digest)
    User.all.each do |user|
      user.password = user.username
      user.save
    end
    puts "Found a password column. Added passwords."
  else
    # puts "No password column found. Didn't add passwords."
  end

  users = User.all

  user1 = users.at(0)
  user2 = users.at(1)

  p "Added #{User.count} Users"

  itinerary = Itinerary.new
  itinerary.id = 3
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
  itinerary2.id = 4
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

  activity1 = Activity.new
  activity1.id = 5
  activity1.name = "Taberna Sal Grosso"
  activity1.description = "Lunch!"
  activity1.cover_image = "https://images.culinarybackstreets.com/wp-content/uploads/cb_lisbon_tabernasalgrossoupdate_jcc_final_interior.jpg?lossy=1&resize=800%2C533&ssl=1"
  activity1.bookmarks_count = 0
  activity1.location = "Lisbon"
  activity1.rating = 5
  activity1.itinerary_id = itinerary.id
  activity1.traveller_id = itinerary.owner_id
  new_date = Date.new(2024,3,18)
  activity1.date = new_date
  new_time = Time.parse("14:00")
  activity1.time = new_time
  itinerary.activities_count += 1
  itinerary.save
  activity1.save

  activity2 = Activity.new
  activity2.id = 6
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

  likes = [
    {fan_id: 1, itinerary_id: 4}
  ]
  Like.insert_all!(likes)

  p "Added #{Like.count} Likes"

  bookmarks = [
    {bookmarker_id: 1, itinerary_id: 4, activity_id: 6}
  ]
  Bookmark.insert_all!(bookmarks)

  p "Added #{Bookmark.count} Bookmarks"
end
