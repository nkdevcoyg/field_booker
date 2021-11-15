class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :title
      t.integer :price
      t.datetime :start
      t.integer :field_id


      t.timestamps
    end
  end
end

