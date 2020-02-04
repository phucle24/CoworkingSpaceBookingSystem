class AddSpacesReferencesToBookingDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :booking_details, :spaces, foreign_key: true
  end
end
