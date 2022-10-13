class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :saunas
  has_many :reviews, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :visits, dependent: :destroy
  has_many :recommendations, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :comment_likes, dependent: :destroy

  validates :nickname, presence: true

  has_one_attached :profile_image

  def likes_count
    likes_count = 0
    comment_likes_count = 0

    self.reviews.each do |review|
      likes_count += review.likes.count
    end

    self.comments.each do |comment|
      comment_likes_count += comment.comment_likes.count
    end

    likes_count + comment_likes_count
  end

  def self.guest
    find_or_create_by!(email: 'guest@example.com', nickname: 'guest') do |user|
      user.password = SecureRandom.urlsafe_base64
    end
  end
end