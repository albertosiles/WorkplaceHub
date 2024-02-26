# app/models/workspace.rb
class Workspace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true

  # Validate cloudinary_image_id format
  validate :valid_cloudinary_image_id

  # Define a method to generate the image URL from Cloudinary
  def image_url
    if cloudinary_image_id.present?
      Cloudinary::Utils.cloudinary_url(cloudinary_image_id)
    else
      # Return a URL for a placeholder image or handle the case where no image is available
      # Example:
      # "https://via.placeholder.com/300"
    end
  end

  def unavailable_dates
    # Logic to retrieve unavailable dates for the workspace
    # This could involve querying bookings or any other relevant data
  end

  private

  def valid_cloudinary_image_id
    if cloudinary_image_id.present? && !cloudinary_image_id.match(/\A[\w-]+\z/)
      errors.add(:cloudinary_image_id, "is not a valid Cloudinary image ID")
    end
  end
end
