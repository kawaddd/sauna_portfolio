class Review < ApplicationRecord
  belongs_to :user
  belongs_to :sauna
  has_many :likes, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :text, presence: true
  validates :headline, presence: true
  validates :visit_day, presence: true

  validates :score, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 0}, presence: true


  def liked_by?(user)
    likes.where(user_id: user).exists?
  end
end

