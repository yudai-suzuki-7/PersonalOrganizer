class Event < ApplicationRecord
  belongs_to :user

  validates :user_id, presence: true
  validates :title, presence: true
  validates :start_date, presence: true
  validates :end_date, presence: true
  validate :date_validates

  def date_validates
    errors.add(:end_date, "は開始日より後に設定してください。") if end_date.nil? || end_date < Date.today || end_date < start_date
  end
end
