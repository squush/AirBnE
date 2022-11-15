class BookingsController < ApplicationController
  def show
    @user = current_user
    @booking = Booking.find(params[:id])
    # raise
  end
end

private

def booking_params
  params.require(:crime).permit(
    :target, :crime_date, :status, :id, :user_id, :crime_id
  )
end
