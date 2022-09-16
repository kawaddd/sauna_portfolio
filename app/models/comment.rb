class Comment < ApplicationRecord
  belongs_to :sauna
  belongs_to :review
end
