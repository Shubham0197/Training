class SetDefaultsForEmployeeAircraft < ActiveRecord::Migration[7.0]
  def up
    change_column :employees, :availability, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
    change_column :aircrafts, :availability, :datetime, default: -> { 'CURRENT_TIMESTAMP' }
  end
  def down
    change_column :employees, :availability, :datetime, :default => nil
    change_column :aircrafts, :availability, :datetime, :default => nil
  end
end
