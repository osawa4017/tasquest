class RemoveClassificationFromTasks < ActiveRecord::Migration[5.2]
  def change
    remove_column :tasks, :classification_id
  end
end
