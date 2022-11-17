class ChangeDateColumnInBookings < ActiveRecord::Migration[7.0]
  def change
    change_column :bookings, :crime_date, :date
    rename_column :bookings, :crime_date, :date
  end
end
