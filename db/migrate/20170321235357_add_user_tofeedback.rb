class AddUserTofeedback < ActiveRecord::Migration[5.0]
  def change
    add_reference :feedbacks, :user, index: true
  end
end
