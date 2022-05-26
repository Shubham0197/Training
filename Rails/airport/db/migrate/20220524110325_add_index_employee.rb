class AddIndexEmployee < ActiveRecord::Migration[7.0]
  def change
    add_index :employees, :name
  end
end
