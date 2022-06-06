class AddColumnToEmployee < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :count_of_pilots, :integer
  end
end
