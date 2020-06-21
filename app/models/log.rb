class Log < ApplicationRecord
  belongs_to :user

  attachment :log_img

  validates :user_id, presence: true
end
