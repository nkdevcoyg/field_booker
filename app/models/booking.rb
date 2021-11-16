class Booking < ApplicationRecord
  belongs_to :field
  belongs_to :schedule
  belongs_to :user
  has_many :payments

  validates :title, :price, :start, :field_id, presence: true
end
