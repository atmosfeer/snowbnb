class BookingsController < ApplicationController
  before_action :user_signed_in?

  def new
    @booking = Booking.new
  end

  def create
    raise
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @chalet = Chalet.find(params[:chalet_id])
    @booking.chalet_id = @chalet.id

    @booking.total_price = (@booking.leave_on - @booking.arrive_on) * @chalet.daily_price
    if @booking.save!
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

  def available?

  end

end
