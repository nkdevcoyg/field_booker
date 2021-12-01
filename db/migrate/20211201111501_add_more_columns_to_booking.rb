class AddMoreColumnsToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :schedule, :string
    add_reference :bookings, :schedule,  foreign_key: true
  end
end
