class Logictree < ApplicationRecord
  belongs_to :wish, optional: true

  validates :wish_id, presence: true
end
