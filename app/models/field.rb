class Field < ApplicationRecord
  has_many :bookings
  has_one :schedule

  # validates :title, :location, :price, :size, :field_coverage, presence: true

end
