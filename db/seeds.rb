require 'faker'
require 'pry'

# https://github.com/stympy/faker/blob/master/doc/harry_potter.md
=======


5.times do
  User.create(name: Faker::HarryPotter.character, username: Faker::HarryPotter.spell, bio: Faker::HarryPotter.quote, muse: Faker::HarryPotter.house)
end

5.times do
  Venue.create(name: Faker::HarryPotter.location, address: Faker::HarryPotter.book, category: Faker::HarryPotter.house, url: Faker::HarryPotter.spell)
end

5.times do
  Event.create(title: , category: , capacity: , time: , description: , venue_id: )
end

# t.string "title"
# t.string "category"
# t.integer "capacity"
# t.datetime "time"
# t.text "description"
# t.integer "venue_id"



# binding.pry
