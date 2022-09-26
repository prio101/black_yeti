class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.datetime  :booking_at
      t.string :state
      t.references  :user
      t.timestamps
    end
  end
end
