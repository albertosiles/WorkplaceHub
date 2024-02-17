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

    if @booking.save
      redirect_to workspace_path(@workspace), notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /bookings/1
  def update
    @booking = Booking.find(params[:id])
    if @booking.update(booking_params)
      redirect_to workspace_path(@booking.workspace), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /bookings/1
  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to bookings_url, notice: 'Booking was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_booking
    @booking = Booking.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def booking_params
    params.require(:booking).permit(:id_user, :id_workspace, :start_date, :end_date)
  end
end
