class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show approve reject]
  before_action :set_crime, only: %i[new create]

  def index
    # TODO: Refactor these variable names
    @bookings = Booking.where(user: current_user).sort_by { |booking| booking.date }
    @my_crime_bookings = Booking.all.select do |my_crime_booking|
      my_crime_booking.crime.user == current_user
    end
    @my_crime_bookings.sort_by! { |booking| booking.date }
  end

  def show
    @user = current_user
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
      redirect_to  bookings_path([@booking.user])
    else
      render :new, status: :unprocessable_entity
    end
    # authorize @booking
  end

  # Andrew
  def approve
    @booking.status = 1
    if @booking.save
      redirect_to bookings_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # Andrew
  def reject
    @booking.status = 2
    if @booking.save
      redirect_to bookings_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_crime
    @crime = Crime.find(params[:crime_id])
  end

  def booking_params
    params.require(:booking).permit(:target, :date, :photo)
  end
end
