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
    a_year  = booking_params["arrive_on(1i)"].to_i
    a_month = booking_params["arrive_on(2i)"].to_i
    a_day   = booking_params["arrive_on(3i)"].to_i
    return Date.new(a_year, a_month, a_day)
  end

  def departure_date
    l_year  = booking_params["leave_on(1i)"].to_i
    l_month = booking_params["leave_on(2i)"].to_i
    l_day   = booking_params["leave_on(3i)"].to_i
    return Date.new(l_year, l_month, l_day)
  end
end
