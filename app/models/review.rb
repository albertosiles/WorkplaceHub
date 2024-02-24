class Review < ApplicationRecord
  belongs_to :workspace
  belongs_to :user

  validates :rating, presence: true
  validates :rating, inclusion: { in: 1..5, message: "Ranking must be between 1 and 5" }
end
