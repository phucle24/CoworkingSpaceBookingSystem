class AddUsersReferencesToBookingDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :booking_details, :users, foreign_key: true
  end
end
