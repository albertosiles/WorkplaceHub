class BookingsController < ApplicationController
  # Ensure the user is authenticated before performing any action
  before_action :authenticate_user!

  def index
    @bookings = current_user.bookings
  end

  # POST /bookings
  def create
    @workspace = Workspace.find(params[:workspace_id])
    @booking = @workspace.bookings.new(booking_params)
    @booking.user = current_user
    @booking.total_price = total_price(@booking.start_date, @booking.end_date)

    if @booking.save
      redirect_to bookings_path, notice: 'Booking was successfully created.'
    else
      redirect_to bookings_path, alert: 'Sorry, this workplace is booked already.'
    end
  end

  # PATCH/PUT /bookings/1
  # Other actions...

  private

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

  def total_price(start_date, end_date)
    @workspace.price * (end_date - start_date).to_i
  end
end
