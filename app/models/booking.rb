class Booking < ApplicationRecord
  has_many :users
  belongs_to :field
  belongs_to :schedule
  has_many :payments
end
