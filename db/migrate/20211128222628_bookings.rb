class Bookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :title
      t.integer :price
      t.string :booking_date
      t.string :end_date


      t.timestamps
    end
  end
end
