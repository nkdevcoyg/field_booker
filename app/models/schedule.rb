class Schedule < ApplicationRecord
  belongs_to :field
  has_many :bookings
end
