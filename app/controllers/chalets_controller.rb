class ChaletsController < ApplicationController
  def index
  end

  def show
    @chalet = Chalet.find(params[:id])
  end

  def search
    @city = params[:search][:query].capitalize
    @chalets = Chalet.near(@city, 500)
    @markers = Gmaps4rails.build_markers(@chalets) do |chalet, marker|
      marker.lat chalet.latitude
      marker.lng chalet.longitude
    end
  end

end
