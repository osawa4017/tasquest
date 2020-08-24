class AddClassificationToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :classification_id, :integer, null: false
  end
end
