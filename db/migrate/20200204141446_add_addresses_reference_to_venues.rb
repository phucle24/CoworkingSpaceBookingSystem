class AddAddressesReferenceToVenues < ActiveRecord::Migration[5.2]
  def change
    add_reference :venues, :addresses, foreign_key: true
  end
end
