class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :review
  has_many :comment_likes, dependent: :destroy

  validates :comment, presence: true

  def comment_liked_by?(user)
    comment_likes.where(user_id: user).exists?
  end
end
