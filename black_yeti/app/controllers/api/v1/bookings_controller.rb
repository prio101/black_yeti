class Api::V1::BookingsController < Api::AuthenticatedApiController
  def index
    @bookings = Booking.where(user_id: @user.id)
  end

  def create
    @booking = Booking.new
    @booking.booking_at = params['body']['data']['booking_at']
    @booking.state = params['body']['data']['state']
    @booking.user_id = @user.id
    @booking.save!
  end

  def update
    @booking = Booking.find(params['id'])
    render json: { data: 'Not Authorised' }, status: 401 unless @booking.user_id == @user.id
    return unless @booking.user_id == @user.id
    @booking.booking_at = params['body']['data']['booking_at']
    @booking.state = params['body']['data']['state']
    @booking.user_id = @user.id
    @booking.save!
  end

  def destroy
    @booking = Booking.find(params['id'])
    render json: { data: 'Not Authorised' }, status: 401 unless @booking.user_id == @user.id
    return unless @booking.user_id == @user.id
    if @booking.delete
      render json: { data: "Booking ID: #{@booking.id} Has been deleted" }, status: :ok
    end
  end
end
