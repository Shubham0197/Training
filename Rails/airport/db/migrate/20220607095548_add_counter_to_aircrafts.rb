class AddCounterToAircrafts < ActiveRecord::Migration[7.0]
  def change
    add_column :aircrafts, :certifieds_count, :integer, default: 0
    Aircraft.find_each { |aircraft| Aircraft.reset_counters(aircraft.id, :certifieds) }
  end
end
