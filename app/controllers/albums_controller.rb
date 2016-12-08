class AlbumsController < ApplicationController

  before_action :require_login

  def show
    @album = Album.find(params[:id])
  end

  def new
    @bands = Band.all
  end

  def create
    @album = Album.new(album_params)
    @bands = Band.all
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:messages] = @album.errors.full_messages
      render :new
    end
  end

  def edit
    @album = Album.find(params[:id])
    @bands = Band.all
  end

  def update
    @album = Album.find(params[:id])
    @bands = Band.all
    if @album.update_attributes(album_params)
      redirect_to album_url(@album)
    else
      flash.now[:messages] = @album.errors.full_messages
      render :edit
    end
  end

  def destroy
    @album = Album.find(params[:id])
    band = @album.band
    @album.destroy
    redirect_to band_url(band)
  end

  private

  def album_params
    params.require(:album).permit(:title, :live, :band_id)
  end

end
