class AdvertisementsController < ApplicationController
  def index
    @ads = Advertisement.all
  end

  def show
    @ad = Advertisement.find(params[:id])
  end

  def new
    @ad = Advertisement.new
  end

  def create
    @ad = Advertisement.new
    @ad.title = params[:advertisement][:title]
    @ad.copy = params[:advertisement][:copy]
    if @ad.save
      flash[:notice] = "Ad was saved."
      redirect_to @ad
    else
      flash.now[:alert] = "There was an error saving the ad. Please try again."
      render :new
    end
  
  end
end
