class AddUsersReferenceToVenues < ActiveRecord::Migration[5.2]
  def change
    add_reference :venues, :belongs_to_user, foreign_key: {to_table: :users}
  end
end
