class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content, null: false
      t.integer :classification_id, null: false
      t.integer :point, null: false
      t.datetime :deadline, null: false
      t.boolean :is_complete, null: false, default: false

      t.timestamps
    end
  end
end
