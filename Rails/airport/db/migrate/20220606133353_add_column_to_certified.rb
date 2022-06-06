class AddColumnToCertified < ActiveRecord::Migration[7.0]
  def change
    add_column :aircrafts, :aircraft_updated_at, :timestamp
  end
end
