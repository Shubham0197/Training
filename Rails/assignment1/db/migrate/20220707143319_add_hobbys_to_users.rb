class AddHobbysToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :hobbys, :text, array: true, default: []
  end
end
