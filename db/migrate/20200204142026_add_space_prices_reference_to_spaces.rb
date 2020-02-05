class AddSpacePricesReferenceToSpaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :spaces, :space_prices, foreign_key: true
  end
end
