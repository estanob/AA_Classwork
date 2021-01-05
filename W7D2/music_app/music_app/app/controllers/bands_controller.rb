class BandsController < ApplicationController
  # skip_before_action :verify_authenticity_token

  def new
    @band = Band.new
    render :new
  end

  def index 
    @bands = Band.all
    render :index
  end

  def show
    @band = Band.find(params[:id])
    render :show
  end

  def create
    @band = Band.new(band_params)
    if @band.save
      redirect_to band_url(@band.id)
    else
      render :new
    end
  end

  def edit
    @band = Band.find(params[:id])
    render :edit
  end

  def destroy
    @band = Band.find(params[:id])
    @band.destroy
    render :index
  end

  private

  def band_params
    params.require(:band).permit(:name)
  end

end
