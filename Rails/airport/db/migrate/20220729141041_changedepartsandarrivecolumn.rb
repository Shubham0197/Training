class Changedepartsandarrivecolumn < ActiveRecord::Migration[7.0]
  def change
    remove_column :flights, :departs
    remove_column :flights, :arrives
    add_column :flights, :departs, :datetime
    add_column :flights, :arrives, :datetime
  end
end
