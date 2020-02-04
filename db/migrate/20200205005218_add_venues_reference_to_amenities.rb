class AddVenuesReferenceToAmenities < ActiveRecord::Migration[5.2]
  def change
    add_reference :amenities, :venues, foreign_key: true
  end
end
