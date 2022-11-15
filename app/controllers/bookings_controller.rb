class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show]

  def show
    @user = current_user
    # raise
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
