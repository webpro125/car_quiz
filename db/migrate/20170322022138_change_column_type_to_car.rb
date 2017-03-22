class ChangeColumnTypeToCar < ActiveRecord::Migration[5.0]
  def change
    remove_column :cars, :type
    add_column :cars, :car_type, :string
  end
end
