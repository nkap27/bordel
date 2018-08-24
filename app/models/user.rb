class User < ApplicationRecord
  has_secure_password

  has_many :comments, dependent: :destroy
  has_many :events, through: :comments

  validates :username, uniqueness: { case_sensitive: false }
  validates :username, length: { within: 5..16 }
  validates :name, length: { within: 5..16 }
  validates :muse, length: { within: 3..16 }
  validates :bio, length: { maximum: 200 }

  def events_hosting
    Event.all.select { |event| event.host == self }
  end


#sorting user_events by number of attendees
  def event_attendees_sort
    events.sort_by { |event| event.unique_users.count }
  end

  def most_intimate
    event_attendees_sort.first
  end

  def most_popular
    event_attendees_sort.last
  end

end
