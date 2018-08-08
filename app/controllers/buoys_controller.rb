class BuoysController < ApplicationController
  before_action :set_buoy, only: [:show, :edit, :update, :destroy]

  def index
    @buoys = Buoy.all
  end

  def show
  end

  def new
    @array = ["Food", "Animal", "Unicorn", "Cartoon", "Classic", "Weird"]
    @buoy = Buoy.new
  end

  def create
    @buoy = Buoy.new(buoy_params)
    @buoy.user = current_user
    if @buoy.save
      @buoy.save
      redirect_to buoy_path(@buoy)
    else
      render :new
    end
  end

  def edit
    @array = ["Food", "Animal", "Unicorn", "Cartoon", "Classic", "Weird"]
  end

  def update
    @buoy = Buoy.update(buoy_params)
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
    params.require(:buoy).permit(:title, :age, :description, :capacity, :price_per_day, :category, :photo)
  end

end
