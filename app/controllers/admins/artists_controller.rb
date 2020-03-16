class Admins::ArtistsController < ApplicationController
  before_action :authenticate_admin!
  def index
    @artists = Artist.all
  end

  def show
    @artist = Artist.find(params[:id])
  end

  def new
    @artist = Artist.new
  end

  def create
    @artist = Artist.new(artist_params)
    @artist.save
    redirect_to admins_artists_path
  end

  private
  def artist_params
    params.require(:artist).permit(:name)
  end
end
