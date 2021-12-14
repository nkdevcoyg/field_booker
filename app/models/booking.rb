class Booking < ApplicationRecord
  belongs_to :field, optional: true
  belongs_to :user, optional: true
  has_one :payment


  private

end
