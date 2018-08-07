class BuoysController < ApplicationController
  before_action :set_buoy, only: [:show, :edit, :delete]

  def index
    @buoys = Buoy.all
  end

  def show
  end

  def new
    @buoy = Buoy.new
  end

  def create
    @buoy = Buoy.new(buoy_params)
    @buoy.user = user
    if @buoy.save
      @buoy.save!
      redirect_to buoy_path(@buoy)
    else
      render :new
    end
  end

  def edit
    @buoy = Buoy.new
  end

  def update
    @buoy = Buoy.new(buoy_params)
    if @buoy.update
      redirect_to buoy_path(@buoy)
    else
      render :new
    end
  end

  def delete
    @buoy.delete
  end

  private

  def set_buoy
    @buoy = Buoy.find(params[:id])
  end

  def buoy_params
    params.require(:buoy).permit(:title, :age, :description, :capacity, :price_per_day, :category)
  end

end
