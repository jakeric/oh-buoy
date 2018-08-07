class BookingsController < ApplicationController
  def new
    @booking = Booking.new
  end

  def create
    @buoy = Buoy.find(params[:buoy_id])
    @booking = Booking.new(bookings_params)
    @booking.buoy = @buoy
    @booking.user = user
    if @booking.save
      @booking.save
      redirect_to buoy_path(@buoy)
    else
      @booking = Booking.new
      render "buoys/show"
    end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
  end

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
