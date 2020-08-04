class ChangeColumnToUser < ActiveRecord::Migration[5.2]
  def up
    change_column :users, :nickname, :string, null: false, default: "", limit: 10
  end

  def down
    change_column :users, :nickname, :string, null: false, default: ""
  end
end
