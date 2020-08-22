class CreateRoutines < ActiveRecord::Migration[5.2]
  def change
    create_table :routines do |t|
      t.references :user, null: false, foreign_key: true
      t.string :content, null: false
      t.date :deadline
      t.boolean :is_complete
      t.timestamps
    end
  end
end
