class HomeController < ApplicationController
  def index
    @cities = Chalet.select('distinct(city)').map(&:city)
  end
end
