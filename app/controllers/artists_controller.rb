class ArtistsController < ApplicationController

  def current_artist
    @artist = Artist.find(params[:id])
  end
  helper_method :current_artist

  def show
    @artist = current_artist
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.create(artist_params)
    redirect_to artist_path(@artist)
  end

  def edit
    @artist = current_artist
  end

  def update
    current_artist.update(artist_params)
    redirect_to artist_path(current_artist)
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio)
  end

end
