class Field < ApplicationRecord
  has_many :bookings
  has_many :payments
end
