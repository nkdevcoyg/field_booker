class Booking < ApplicationRecord
  belongs_to :fields
  belongs_to :schedules
  belongs_to :users
  has_one :payment

  # validates :title, :price, :start, :field_id, presence: true
end
