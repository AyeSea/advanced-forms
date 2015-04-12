class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :start_id
      t.integer :finish_id
      t.datetime :start_datetime
      t.time :duration

      t.timestamps null: false
    end
  end
end
