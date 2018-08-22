class User < ApplicationRecord
  has_many :comments
  has_many :events, through: :comments
  validates :username, uniqueness: { case_sensitive: false }
  validates :username, length: { within: 5..16 }
  validates :name, length: { within: 5..16 }
  validates :muse, length: { within: 3..16 }
  validates :bio, length: { maximum: 200 }
end
