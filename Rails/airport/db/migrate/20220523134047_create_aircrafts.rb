class CreateAircrafts < ActiveRecord::Migration[7.0]
  def change
    create_table :aircrafts do |t|
      t.text :name
      t.integer :cruising_range
      t.timestamps
    end
  end
end
