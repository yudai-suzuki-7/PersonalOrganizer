class WishCheck < ApplicationRecord
  belongs_to :wish, optional: true
end
