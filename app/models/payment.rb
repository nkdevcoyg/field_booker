class Payment < ApplicationRecord
  belongs_to :booking
  belongs_to :user

  # validates :date, :price, :user_id, presence: true
end
