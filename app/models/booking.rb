class Booking < ApplicationRecord
  belongs_to :field
  belongs_to :schedule
  belongs_to :user
  has_one :payment

  validate :no_past_booking
  validates_presence_of :starts, :ends
  validate :overlaps
  # validates :title, :price, :start, :field_id, presence: true

  def no_past_booking
    if Date.today > starts.to_date || Time.now > starts.to_time
      errors.add(:Starts, "cannot be in the past")
      elsif Date.today > ends.to_date || Time.now > ends.to_time
    end
  end

  def overlaps
    bookings = Booking.where(field_id: id)
    bookings.each do |booking|
      if starts < booking.ends && booking.starts < ends
        errors.add(:overlaps, 'Already booked')
      end
    end
  end
end
