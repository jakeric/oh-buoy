class PhotosController < ApplicationController

  def new
    @photo = Photo.new
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.save

    # no need for app/views/photos/create.html.erb
    redirect_to photo_path(@photo)
  end

  def destroy
    @photo = Photo.find(params[:id])
    @photo.destroy
  end

private

  def photo_params
    params.require(:photo).permit(:title, :body, :photo)
  end
end
