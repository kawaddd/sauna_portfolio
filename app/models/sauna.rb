class Sauna < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews
  has_many :bookmarks
  has_many :recommendations

  has_one_attached :store_image
end
