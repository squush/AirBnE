class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :crime

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2,
    done: 3
  }

  validates :target, presence: true
  validates :crime_date, presence: true
end
