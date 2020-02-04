class CreatePayments < ActiveRecord::Migration[5.2]
  def change
    create_table :payments do |t|
      t.string :method
      t.boolean :status

      t.timestamps
    end
  end
end
