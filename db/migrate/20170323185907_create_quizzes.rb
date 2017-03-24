class CreateQuizzes < ActiveRecord::Migration[5.0]
  def change
    create_table :quizzes do |t|
      t.integer :mileage
      t.string :vehicle_type
      t.string :seat_number
      t.integer :wd
      t.integer :year
      t.integer :color
      t.integer :type
      t.timestamps
    end
    add_reference :quizzes, :user, index: true
  end
end
