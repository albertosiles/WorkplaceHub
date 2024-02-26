class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :workspace
  validate :check_uniqueness_of_date_per_workspace

  private

  def check_uniqueness_of_date_per_workspace
    if Booking.exists?(workspace_id: workspace_id, start_date: start_date..end_date)
      errors.add(:base, "This workspace is already booked for the selected date range")
    end
  end
end
