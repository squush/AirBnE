class CreateCrimes < ActiveRecord::Migration[7.0]
  def change
    create_table :crimes do |t|
      t.string :crime_type
      t.string :area
      t.integer :price
      t.integer :years_experience
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
