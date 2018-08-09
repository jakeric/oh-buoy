class BookingsController < ApplicationController
  def new
    @booking = Booking.new
    @buoy = Buoy.find(params[:buoy_id])
    respond_to do |format|
      format.js
      format.html
    end
  end

  def create
    @buoy = Buoy.find(params[:buoy_id])

    # calculating the renting days
    days = (bookings_params["end_date"].to_date - bookings_params["start_date"].to_date).to_i
    total_price = (days + 1) * @buoy.price_per_day

    @booking = Booking.new(bookings_params)
    @booking.total_price = total_price
    @booking.buoy = @buoy
    @booking.user = current_user
    if @booking.save
      @booking.save!
      redirect_to dashboard_path
    else
      @booking = Booking.new
      render "buoys/show"
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    if @booking.start_date <= Date.today
      @booking.destroy
      redirect_to dashboard_path
    else
      redirect_to dashboard_path
    end
  end

  private

  def bookings_params
    params.require(:booking).permit(:start_date, :end_date)
  end
end
