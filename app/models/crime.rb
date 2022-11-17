class Crime < ApplicationRecord
  belongs_to :user
  has_many :bookings, dependent: :destroy

  validates :crime_type, presence: true
  validates :area, presence: true
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }

  include PgSearch::Model
  pg_search_scope :search_by_type_and_area_and_user,
    against: {
      crime_type: 'A',
      area: 'B'
    },
    associated_against: {
      user: [ :username ]
    },
    using: {
      tsearch: { prefix: true }
    }
end
