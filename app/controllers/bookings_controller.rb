class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show]
  before_action :set_crime, only: %i[new create]

  def index
    @bookings = Booking.where(user: current_user)
  end

  def show
    @user = current_user
    # raise
  end

  # anabelle
  def new
    @booking = Booking.new
    # authorize @booking
  end

  def create
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @booking.crime = @crime
    if @booking.save
      redirect_to  user_bookings_path([@booking.user])
    else
      render :new, status: :unprocessable_entity
    end
    # authorize @booking
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_crime
    @crime = Crime.find(params[:crime_id])
  end

  def booking_params
    params.require(:booking).permit(:target, :crime_date)
  end
end
