class Todo < ApplicationRecord
  validates :user_id, presence: true
  validates :todo_text, presence: true

  belongs_to :user

  include RankedModel
  ranks :row_order , with_same: :user_id

  enum todo_status: { undone: 0, done: 1 }
end
