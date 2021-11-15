class Payment < ApplicationRecord
  belongs_to :booking
  belongs_to :user
end
