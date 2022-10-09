class Web::V1::BookingsController < WebsController
  before_action :set_booking, except: [ :index, :new, :create ]
  before_action :initiate_booking, only: [ :new, :create ]

  def index
    @bookings = Booking.where(user_id: current_user.id).order(created_at: :desc).page params[:page]
  end

  def new
    @booking = Booking.new
    @service_id = params[:service_id]
  end

  def create
    @booking = Booking.new
    ActiveRecord::Base.transaction do
      @booking.user_id = current_user.id
      @booking.service_id = params[:service_id]
      @booking.booking_at = params[:booking_at]
      @booking.extra_notes = params[:area_in_sqr_feet]
      @booking.state = 'On Progress'
      @booking.save!
    end
    redirect_to web_v1_bookings_path, notice: 'Booking Is Done.'
  end

  def edit
    # not implemented
  end

  def update
    # not implemented
  end

  def destroy
    if @booking.update(state: :canceled)
      redirect_to web_v1_bookings_path, notice: 'Your Booking has been cancelled'
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def initiate_booking
    @booking = Booking.new
  end
end
