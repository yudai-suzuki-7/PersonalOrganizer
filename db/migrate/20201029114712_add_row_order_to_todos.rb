class AddRowOrderToTodos < ActiveRecord::Migration[5.2]
  def change
    add_column :todos, :row_order, :integer
  end
end
