class Wish < ApplicationRecord
  has_many :logictree, dependent: :destroy
  belongs_to :user

  validates :user_id, presence: true
  validates :wish_text, presence: true
end
