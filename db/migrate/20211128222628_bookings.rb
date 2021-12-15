class Bookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :title
      t.integer :price
      t.datetime :booking_date
      t.datetime :end_date
      t.integer :field_id
      t.integer :user_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end
