class AddVenuesReferenceToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :spaces, :venues, foreign_key: true
  end
end
