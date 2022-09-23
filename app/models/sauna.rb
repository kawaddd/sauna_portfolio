class Sauna < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews
  has_many :bookmarks, dependent: :destroy
  has_many :recommendations
  
  has_one_attached :store_image
  
  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end
end
