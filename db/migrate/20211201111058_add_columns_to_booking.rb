class AddColumnsToBooking < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :field, :string
    add_reference :bookings, :field,  foreign_key: true
  end
end
