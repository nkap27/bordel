class User < ApplicationRecord
  has_many :comments
  has_many :reviews
  has_many :events, through: :comments
  has_many :venues, through: :reviews
end
