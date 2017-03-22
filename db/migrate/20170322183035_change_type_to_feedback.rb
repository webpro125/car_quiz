class ChangeTypeToFeedback < ActiveRecord::Migration[5.0]
  def change
    rename_column :feedbacks, :type, :feedback_type
  end
end
