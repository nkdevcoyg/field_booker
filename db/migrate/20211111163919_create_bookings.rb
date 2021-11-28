class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.string :title
      t.integer :price
      t.datetime :starts
      t.datetime :ends
      t.integer :field_id
      t.integer :user_id
      t.integer :schedule_id

      t.timestamps
    end
  end
end

