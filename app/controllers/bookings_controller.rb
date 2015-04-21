class BookingsController < ApplicationController
  before_action :user_authenticate!

  def new
    @booking = Booking.new
  end

  def create
    @booking = @booking.update(booking_params)
    if @booking.save
      redirect_to account_bookings_path
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
      params.require(:booking).permit(:total_price, :arrive_on, :leave_on, :chalet_id, :user_id)
    end

end
