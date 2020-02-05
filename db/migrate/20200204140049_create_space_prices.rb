class CreateSpacePrices < ActiveRecord::Migration[5.2]
  def change
    create_table :space_prices do |t|
      t.decimal :per_month
      t.decimal :per_day
      t.decimal :per_hour

      t.timestamps
    end
  end
end
