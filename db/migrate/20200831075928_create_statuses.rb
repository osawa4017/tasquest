class CreateStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :statuses do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :heart, null: false, default: 0
      t.integer :attack, null: false, default: 0
      t.integer :defense, null: false, default: 0
      t.timestamps
    end
  end
end
