class Sauna < ApplicationRecord
  belongs_to :user
  has_many :reviews
  has_many :bookmarks
  has_many :recommendations
end
