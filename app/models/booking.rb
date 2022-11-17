class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :crime
  has_one_attached :photo

  enum status: {
    pending: 0,
    accepted: 1,
    rejected: 2,
    cancelled: 3,
    done: 4
  }

  validates :target, presence: true
  validates :crime_date, presence: true
  # TODO: Possibly a validation that user_id doesn't match the crime's user id?
end
