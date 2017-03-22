class CreateCars < ActiveRecord::Migration[5.0]
  def change
    create_table :cars do |t|
      t.string :zip_code
      t.integer :year
      t.string :make
      t.string :model
      t.string :color
      t.string :vin
      t.integer :mileage
      t.float :price
      t.string :days_to_sell
      t.string :seat_number
      t.string :vehicle_type
      t.integer :wd
      t.integer :type
      t.timestamps
    end
  end
end
