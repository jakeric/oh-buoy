class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @booking.review = @review
    @review.user = current_user
    if @review.save
      @review.save!
      redirect_to buoy_bookings_path(@booking)
    else
      render :new
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:description, :rating)
  end
end
