class CreateFlights < ActiveRecord::Migration[7.0]
  def change
    create_table :flights do |t|
      t.text :from
      t.text :destination
      t.integer :distance
      t.time :departs
      t.time :arrives
      t.integer :price
      t.timestamps
    end
  end
end
