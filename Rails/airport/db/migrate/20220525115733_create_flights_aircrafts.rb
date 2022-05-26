class CreateFlightsAircrafts < ActiveRecord::Migration[7.0]
  def change
    create_table :flights_aircrafts do |t|
      t.belongs_to :flight
      t.belongs_to :aircraft
      t.timestamps
    end
  end
end
