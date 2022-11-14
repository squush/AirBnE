class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :target
      t.datetime :crime_date
      t.integer :status
      t.references :user, null: false, foreign_key: true
      t.references :crime, null: false, foreign_key: true

      t.timestamps
    end
  end
end
