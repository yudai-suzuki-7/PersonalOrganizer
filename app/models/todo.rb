class Todo < ApplicationRecord
  validates :user_id, presence: true
  validates :todo_text, presence: true

  acts_as_list

  enum todo_status: { undone: 0, done: 1 }
end
