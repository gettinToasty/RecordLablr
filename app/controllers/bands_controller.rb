class BandsController < ApplicationController

  before_action :require_login

  def index
    @bands = Band.all
  end

  def show
    @band = Band.find(params[:id])
  end

  def new
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band)
    else
      flash.now[:messages] = @band.errors.full_messages
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
  end

  def update
    @band = Band.find(params[:id])
    if @band.update
      redirect_to band_url(@band)
    else
      flash.now[:messages] = @band.errors.full_messages
      render :new
    end
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy

    redirect_to bands_url
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
