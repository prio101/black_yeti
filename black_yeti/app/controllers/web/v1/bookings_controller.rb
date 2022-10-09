class Web::V1::BookingsController < WebsController
  def index
    @bookings = Booking.where(user_id: current_user.id).page params[:page]
  end

  def create
  end
end
