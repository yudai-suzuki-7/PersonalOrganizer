class Log < ApplicationRecord
  belongs_to :user

  attachment :log_img

  validates :user_id, presence: true
  validates :title, presence: true

  default_scope -> { order(created_at: :desc) }

end
