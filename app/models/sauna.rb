class Sauna < ApplicationRecord
  belongs_to :user, optional: true
  has_many :reviews
  has_many :bookmarks, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :recommendations

  has_one_attached :store_image

  def bookmarked_by?(user)
    bookmarks.where(user_id: user).exists?
  end

  def visited_by?(user)
    visits.where(user_id: user).exists?
  end

  def review_avg
    review_total = 0

    self.reviews.each do |review|
      review_total += review.score
    end

    if self.reviews.size != 0
      review_total / (self.reviews.size)
    else
      0
    end
  end
end
