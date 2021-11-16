class CreatePayments < ActiveRecord::Migration[6.1]
  def change
    create_table :payments do |t|
      t.date :date
      t.integer :price
      t.integer :user_id
      t.integer :booking_id

      t.timestamps
    end
  end
end
