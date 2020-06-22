class AddColumnUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :todo_status, :integer, default: 0
    add_column :users, :booklog_status, :integer, default: 0
  end
end
