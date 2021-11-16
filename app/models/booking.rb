class Booking < ApplicationRecord
  has_many :users
  belongs_to :field
  belongs_to :schedule
  has_many :payments

  validates :title, :price, :start, :field_id, presence: true
end
