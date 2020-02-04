class AddTypesReferenceToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :spaces, :types, foreign_key: true
  end
end
