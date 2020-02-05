class AddPaymentsReferenceToBookingDetails < ActiveRecord::Migration[5.2]
  def change
    add_reference :booking_details, :payments, foreign_key: true
  end
end
