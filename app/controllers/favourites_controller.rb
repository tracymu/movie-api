class FavouritesController < ApplicationController

  def index
    @favourites = Favourite.all
  end

  def new
    @favourite = Favourite.new
  end

  def create
    @favourite = Favourite.new(favourite_params)
    if @favourite.save
      redirect_to favourites_path, notice: 'Favourite was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @favourite.destroy
    redirect_to favourites_url, notice: 'Favourite was successfully destroyed.'
  end

  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def favourite_params
    params.require(:favourite).permit(:title, :url)
  end
end
