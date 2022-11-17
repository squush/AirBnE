class AddCoordinatesToCrimes < ActiveRecord::Migration[7.0]
  def change
    add_column :crimes, :latitude, :float
    add_column :crimes, :longitude, :float
  end
end
