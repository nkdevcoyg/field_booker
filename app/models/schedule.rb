class Schedule < ApplicationRecord
  belongs_to :field
  has_many :bookings

  # validates :title, :start, :end, :field_id, presence: true
end
