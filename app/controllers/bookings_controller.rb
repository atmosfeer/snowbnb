class BookingsController < ApplicationController
  before_action :user_signed_in?

  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @chalet = Chalet.find(params[:chalet_id])

    @booking.chalet_id = @chalet.id
    @booking.total_price = (@booking.leave_on - @booking.arrive_on) * @chalet.daily_price
    if !@chalet.available?(arrival_date, departure_date)
      flash.alert = "Hey loser, the chalet is not available on your selected dates, so fuck off."
      render 'new'
    elsif @chalet.user_id == current_user.id
      redirect_to account_user_path
      flash.alert = "Hey loser, you're trying to book your own place, so fuck off."

    elsif @booking.save!
      redirect_to account_user_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
      params.require(:booking).permit(:arrive_on, :leave_on, :chalet_id, :user_id)
  end

  def arrival_date
    Date.parse(booking_params[:arrive_on])
  end

  def departure_date
    Date.parse(booking_params[:leave_on])
  end
end
