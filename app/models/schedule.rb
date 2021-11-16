class Schedule < ApplicationRecord
  belongs_to :fields
  has_many :bookings

  # validates :title, :start, :end, :field_id, presence: true
end
