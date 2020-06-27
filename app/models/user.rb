class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :event, dependent: :destroy
  has_many :log, dependent: :destroy
  has_many :wish, dependent: :destroy

  enum todo_status: { notuse1: 0, use1: 1 }
  enum booklog_status: { notuse2: 0, use2: 1 }

end
