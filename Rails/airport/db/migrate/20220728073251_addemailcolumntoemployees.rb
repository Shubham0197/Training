class Addemailcolumntoemployees < ActiveRecord::Migration[7.0]
  def change
    add_column :employees, :email, :string
    add_column :employees, :account_type, :string
  end
end
