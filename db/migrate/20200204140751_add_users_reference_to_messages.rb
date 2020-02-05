class AddUsersReferenceToMessages < ActiveRecord::Migration[5.2]
  def change
    add_reference :messages, :users, foreign_key: true
  end
end
