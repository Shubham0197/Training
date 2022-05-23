class UsingColumnModifiers < ActiveRecord::Migration[7.0]
  def change
    change_column :employees, :name, :string, null: false
    change_column :employees, :mobile_number, :string, limit: 12
    change_column :employees, :DOB, :date, default: "01/01/1997"
  end
end
