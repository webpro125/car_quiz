class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.integer :type
      t.text :content
      t.string :first_name
      t.string :last_name
      t.string :email
      t.timestamps
    end
  end
end
