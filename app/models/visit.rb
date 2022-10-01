class Visit < ApplicationRecord
  belongs_to :user
  belongs_to :sauna
  validates :user_id, uniqueness: { scope: :sauna_id }
end
