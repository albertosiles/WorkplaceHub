class Review < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  validates :rating, presence: true
end
