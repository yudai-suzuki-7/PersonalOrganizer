class Todo < ApplicationRecord
  validates :user_id, presence: true
  validates :todo_text, presence: true

  enum status: { undone: 0, done: 1 }
end
