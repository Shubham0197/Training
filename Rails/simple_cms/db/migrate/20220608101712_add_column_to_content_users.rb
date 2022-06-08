class AddColumnToContentUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :content_users, :type, :string
    rename_table :content_users, :users
  end
end
