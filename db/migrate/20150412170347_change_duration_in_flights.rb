class ChangeDurationInFlights < ActiveRecord::Migration
  def change
  	change_column :flights, :duration, :integer
  end
end
