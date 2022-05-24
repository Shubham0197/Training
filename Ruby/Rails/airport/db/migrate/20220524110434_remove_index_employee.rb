class RemoveIndexEmployee < ActiveRecord::Migration[7.0]
  def change
    remove_index :employees, :name
  end
end
