class ChaletsController < ApplicationController
  def index
  end

  def show
    @chalet = Chalet.find(params[:id])
  end

  def search
    @city = params[:search][:query].capitalize
    @chalets = Chalet.near(@city, 500)
  end

end
