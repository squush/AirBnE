class Crime < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :crime_type, presence: true
  validates :area, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
end
