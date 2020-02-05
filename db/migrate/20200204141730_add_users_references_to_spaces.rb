class AddUsersReferencesToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :spaces, :manager, foreign_key: {to_table: :users}
  end
end
