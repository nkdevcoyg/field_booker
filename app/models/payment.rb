class Payment < ApplicationRecord
  belongs_to :bookings
  belongs_to :users

  # validates :date, :price, :user_id, presence: true
end
