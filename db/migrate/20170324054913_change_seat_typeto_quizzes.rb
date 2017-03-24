class ChangeSeatTypetoQuizzes < ActiveRecord::Migration[5.0]
  def change
    remove_column :quizzes, :seat_number
    add_column :quizzes, :seat_number, :integer
  end
end
