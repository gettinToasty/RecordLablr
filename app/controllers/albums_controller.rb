class AlbumsController < ApplicationController
  def show
    @album = Album.find(params[:id])
  end

  def new
  end

  def create
    @album = Album.new(album_params)
    @album.band_id = params[:band_id]
    if @album.save
      redirect_to album_url(@album)
    else
      flash.now[:messages] = @album.errors.full_messages
      render :new
    end
  end


  def edit
    @album = Album.find(params[:id])
  end

  def update
    @album = Album.find(params[:id])
    if @album.update
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
    params.require(:album).permit(:title, :live)
  end

end
