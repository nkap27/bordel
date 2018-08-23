class Event < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  belongs_to :venue
  belongs_to :host, class_name: "User"

  validates :title, length: { within: 5..30 }
  validates :description, length: { minimum: 10 }
  validates :capacity, numericality: { minimum: 1 }
  validate :time, :future?

  def future?
    if time < ::DateTime.current
      errors.add(:time, "can't be in the past.")
    end
  end

  def text_comments
    comments.select { |comment| comment.text != nil  }.reverse
  end

end
