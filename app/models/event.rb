class Event < ApplicationRecord
  has_many :comments
  has_many :users, through: :comments
  belongs_to :venue

  # def add_user(user)
  #   self.users << user
  # end
end
