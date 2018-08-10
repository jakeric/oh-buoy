class BuoysController < ApplicationController
  before_action :set_buoy, only: [:show, :edit, :update, :destroy]

  def index
    if params[:query].present?
      @buoys = Buoy.search("#{params[:query]}")
      if @buoys.empty?
        @error_message = "No search result found"
        @buoys = Buoy.all
      end
    else
      @buoys = Buoy.all
    end
  end

  def show
    @booking = Booking.new
    @user_not_logged = !user_signed_in?
    date_range = []

    @bookings = Booking.where("buoy_id = ?", params[:id])

    @bookings.each do |booking|
      date_range << {from: booking.start_date, to: booking.end_date}
    end

    @date_json = date_range.to_json


    # If we want to implement an average rating
    # def mean(array)
    # array.inject(array.inject(0) { |sum, x| sum += x } / array.size.to_f
    # end
  end

  def new
    @array = ["Food", "Animal", "Unicorn", "Cartoon", "Classic", "Weird"]
    @buoy = Buoy.new
  end

  def create
    @buoy = Buoy.new(buoy_params)
    @buoy.user = current_user
    if @buoy.save
      redirect_to buoys_path
    else
      redirect_to new_buoy_path
    end
  end

  def edit
    @array = ["Food", "Animal", "Unicorn", "Cartoon", "Classic", "Weird"]
  end

  def update
    @buoy.update(buoy_params)
    redirect_to buoy_path(@buoy)
  end

  def destroy
    @buoy.delete
    redirect_to buoys_path
  end

  private

  def set_buoy
    @buoy = Buoy.find(params[:id])
  end

  def buoy_params
    params.require(:buoy).permit(:title, :age, :description, :capacity, :price_per_day, :category, :photo, :street, :photo_cache)
  end

end
