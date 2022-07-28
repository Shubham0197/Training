class CreateSchedules < ActiveRecord::Migration[7.0]
  def change
    create_table :schedules do |t|
      t.belongs_to :flight
      t.belongs_to :aircraft
      t.belongs_to :employee
      t.string     :status
      t.timestamps
    end
    add_column :aircrafts, :place, :string, default: "Delhi"
    add_column :aircrafts, :availability, :datetime
    add_column :employees, :place, :string, default: "Delhi"
    add_column :employees, :availability, :datetime
  end
end
