class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :saunas
  has_many :reviews
  has_many :likes
  has_many :bookmarks, dependent: :destroy
  has_many :recommendations
  has_many :comments

  has_one_attached :profile_image
end


