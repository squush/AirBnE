class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show]
  before_action :set_crime_booking, only: %i[approve reject]

  def index
    @bookings = Booking.where(user: current_user)
    @my_crime_bookings = Booking.all.select do |my_crime_booking|
      my_crime_booking.crime.user == current_user
    end
    # raise

  end

  def show
    @user = current_user
    # raise
  end

  def approve
    # raise
    @booking.status = 1
    if @booking.save
      redirect_to user_bookings_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def reject
    @booking.status = 2
    if @booking.save
      redirect_to user_bookings_path(current_user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def set_crime_booking
    @booking = Booking.find(params[:id])
  end
end
