class Log < ApplicationRecord
  belongs_to :user

  attachment :log_img
end
