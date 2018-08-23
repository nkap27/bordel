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

end
