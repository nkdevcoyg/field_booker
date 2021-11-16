class Payment < ApplicationRecord
  belongs_to :users
  belongs_to :booking

  validates :date, :price, :user_id, presence: true
end
