class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.text :name
      t.integer :salary
      t.text :mobile_number
      t.date :DOB
      t.timestamps
    end
  end
end
