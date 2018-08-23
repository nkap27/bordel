class Event < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  belongs_to :venue
  belongs_to :host, class_name: "User"
  validates :title, length: { within: 5..30 }
  validates :description, length: { minimum: 10 }
  validates :capacity, numericality: { minimum: 1 }

end
