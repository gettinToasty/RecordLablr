class TracksController < ApplicationController

  before_action :require_login

  def show
    @track = Track.find(params[:id])
  end

  def new
    @albums = Album.all
  end

  def create
    @track = Track.new(track_params)
    if @track.save
      redirect_to track_url(@track)
    else
      flash.now[:messages] = @track.errors.full_messages
      render :new
    end
  end

  def edit
    @albums = Album.all
    @track = Track.find(params[:id])
  end

  def update
    @track = Track.find(params[:id])
    if @track.update_attributes(track_params)
      redirect_to track_url(@track)
    else
      flash.now[:messages] = @track.errors.full_messages
      render :edit
    end
  end

  def destroy
    @track = Track.find(params[:id])
    album = @track.album
    @track.destroy
    redirect_to album_url(album)
  end

  private

  def track_params
    params.require(:track).permit(:title, :lyrics, :album_id, :bonus)
  end

end
