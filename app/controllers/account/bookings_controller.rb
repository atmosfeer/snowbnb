module Account
  class BookingsController < BaseController

    def index
      @userbookings = current_user.bookings
      @relevant_bookings = @userbookings.select do |booking|
        booking.arrive_on > Time.now
      end
    end

  end
end