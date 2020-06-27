class CreateTodos < ActiveRecord::Migration[5.2]
  def change
    create_table :todos do |t|
      t.integer :user_id, null: false
      t.string :todo_text,  null: false
      t.integer :todo_status, default: 0

      t.timestamps
    end
  end
end
