class AddColumnsToCar < ActiveRecord::Migration[5.0]
  def change
    add_column :cars, :carmax_link, :string
    add_column :cars, :description, :string
    rename_column :quizzes, :type, :car_type
  end
end
