class Todo < ApplicationRecord
  validates :user_id, presence: true
  validates :todo_text, presence: true

  include RankedModel
  ranks :row_order

  enum todo_status: { undone: 0, done: 1 }
end
