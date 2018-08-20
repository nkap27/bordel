class User < ApplicationRecord
  has_many :comments, :reviews
  has_many :events, through: :comments
  has_many :venues, through: :reviews
end
