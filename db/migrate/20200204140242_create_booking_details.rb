class CreateBookingDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_details do |t|
      t.datetime :time_use_start
      t.datetime :time_use_close
      t.integer :status

      t.timestamps
    end
  end
end
