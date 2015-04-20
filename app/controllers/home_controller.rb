class HomeController < ApplicationController
  def home
    @cities = Chalet.select('distinct(city)').map(&:city)
  end
end
