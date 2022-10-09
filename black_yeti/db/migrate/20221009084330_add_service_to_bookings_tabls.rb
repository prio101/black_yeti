class AddServiceToBookingsTabls < ActiveRecord::Migration[7.0]
  def change
    add_reference :bookings, :service, foreign_key: true
  end
end
