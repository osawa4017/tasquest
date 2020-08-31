class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :heart, null: false
      t.integer :attack, null: false
      t.integer :defense, null: false
      t.timestamps
    end
  end
end
