class ChaletsController < ApplicationController
  def index
  end

  def show
    @chalet = Chalet.find(params[:id])
  end
end
