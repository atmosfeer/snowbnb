module Account
  class BookingsController < BaseController
    def index
      @userbookings = current_user.bookings
    end

  end

end