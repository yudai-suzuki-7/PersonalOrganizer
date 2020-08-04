class Wish < ApplicationRecord
  has_many :logictree, dependent: :destroy
  has_many :wish_check, dependent: :destroy
  belongs_to :user

  validates :user_id, presence: true
  validates :wish_text, presence: true

  enum wish_status: { undone: 0, done: 1 }
end
