# app/models/workspace.rb

class Workspace < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :reviews, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
  validates :price, presence: true
  validates :location, presence: true

  # Method to return the image URL of the workspace
  def image_url
    # Add your logic here to generate or retrieve the image URL
    # For example, if you have an 'image' attribute in your Workspace model,
    # you can return its URL like this:
    # self.image.url
    # Replace 'image' with the actual name of your image attribute.
    # Alternatively, if you're using Cloudinary, you can retrieve the image URL
    # from your Cloudinary storage.
    # For example:
    # Cloudinary::Utils.cloudinary_url(self.image.public_id)
    # This assumes you have a 'public_id' attribute in your Workspace model
    # that corresponds to the Cloudinary public ID of the image.
  end
end
