class AddColumnToCustomr < ActiveRecord::Migration[7.0]
  def change
    add_column :customrs, :lock_customer, :integer
  end
end
