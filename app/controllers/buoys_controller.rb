class BuoysController < ApplicationController
  before_action :set_buoy, only: [:show, :edit, :update, :destroy]

  def index
    @buoys = Buoy.all
  end

  def show
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
