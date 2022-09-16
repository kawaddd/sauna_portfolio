class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sauna
  has_many :likes
  has_many :comments
end
