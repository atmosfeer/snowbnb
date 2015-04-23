class ChaletsController < ApplicationController
  def index
  end

  def show
    @chalet = Chalet.find(params[:id])
    @user = User.find(@chalet.user_id)
  end

  def search
    @city = params[:search][:query].capitalize
    @chalets = Chalet.near(@city, 500)
  end

end
