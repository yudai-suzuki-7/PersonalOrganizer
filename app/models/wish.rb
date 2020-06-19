class Wish < ApplicationRecord
  has_many :logictree, dependent: :destroy
  belongs_to :user
end
