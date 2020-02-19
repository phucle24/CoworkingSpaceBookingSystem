class CreateSpaces < ActiveRecord::Migration[5.2]
  def change
    create_table :spaces do |t|
      t.string :name
      t.integer :capacity
      t.text :description
      t.time :hour_open
      t.time :hour_close
      t.string :time_use_start
      t.string :time_use_close
      t.integer :status
      t.string :picture

      t.timestamps
    end
  end
end
