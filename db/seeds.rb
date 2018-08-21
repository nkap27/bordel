require 'faker'
require 'pry'

# https://github.com/stympy/faker/blob/master/doc/harry_potter.md


venues = [
  {
    name: "Fat Witch Bakery, Chelsea Market",
    address: "75 9th Ave, New York, NY 10011",
    category: "Restaurant",
    url: "https://www.fatwitch.com/"
  },
  {
    name: "Amy Ruth's",
    address: "113 W 116th St, New York, NY 10026",
    category: "Restaurant",
    url: "http://amyruths.com/"
  },
  {
    name: "Cielo",
    address: "18 Little W 12th St, New York, NY 10014",
    category: "Nightclub",
    url: "https://www.cieloclub.com/"
  },
  {
    name: "Luna Park, Coney Island",
    address: "1000 Surf Ave, Brooklyn, NY 11224",
    category: "Amusement Park",
    url: "https://lunaparknyc.com/"
  },
  {
    name: "New York Public Library Main Branch",
    address: "476 5th Ave, New York, NY 10018",
    category: "Library",
    url: "https://www.nypl.org/locations/schwarzman"
  },
]

venues.each do |venue|
  Venue.create(venue)
end

5.times do
  User.create(name: Faker::HarryPotter.character, username: Faker::HarryPotter.unique.spell, bio: Faker::HarryPotter.quote, muse: Faker::HarryPotter.house)
end

events = [
  {
    title: "Gorgopolis",
    capacity: 10,
    time: DateTime.new(2018, 9, 30, 20, 0, 0),
    description: "An opportunity to plumpen oneself in a horde with the delights of the fat witch.",
    venue_id: 1
  },
  {
    title: "Soul Foodies",
    capacity: 8,
    time: DateTime.new(2018, 10, 30, 21, 0, 0),
    description: "Come to Harlem to eat the best chicken and waffles you'll ever have.",
    venue_id: 2
  },
  {
    title: "Time for House",
    capacity: 20,
    time: DateTime.new(2018, 9, 15, 23, 0, 0),
    description: "Dance to the music of the hottest DJs in the world in an intimate club in the Meatpacking District.",
    venue_id: 3
  },
  {
    title: "Rides Galore",
    capacity: 10,
    time: DateTime.new(2018, 8, 30, 13, 0, 0),
    description: "Let's go to Coney Island and live it up the end of summer.",
    venue_id: 4
  },
  {
    title: "Book buddies",
    capacity: 20,
    time: DateTime.new(2018, 10, 30, 14, 0, 0),
    description: "Bring your favorite scary novel or request one from the special collections stack!",
    venue_id: 5
  },
]

events.each do |event|
  Event.create(event)
end
