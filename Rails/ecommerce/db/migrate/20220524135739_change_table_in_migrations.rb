class ChangeTableInMigrations < ActiveRecord::Migration[7.0]
  
  def change 
    change_table :products do |t|
    t.change :price, :decimal, precision: 5, scale: 2
    t.column :desccription, :string
    t.rename :desccription, :description
    end
    create_table :cutomrs do |t|
      t.text :name
      t.string :mobile_number
    end
    rename_table :cutomrs, :customers
    add_column :customers, :zipcode, :integer, :limit => 5 
    change_column_default :products, :price, 100
    change_column_comment :products, :price, 'Price column'
    change_table_comment :products, 'Products data'
  end
end

=begin
output
itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/ecommerce$ rails db:migrate
== 20220524135739 ChangeTableInMigrations: migrating ==========================
-- change_table(:products)
   -> 0.0052s
-- create_table(:cutomrs)
   -> 0.0033s
-- rename_table(:cutomrs, :customers)
   -> 0.0029s
-- add_column(:customers, :zipcode, :integer, {:limit=>5})
   -> 0.0006s
-- change_column_default(:products, :price, 100)
   -> 0.0013s
-- change_column_comment(:products, :price, "Price column")
   -> 0.0004s
-- change_table_comment(:products, "Products data")
   -> 0.0004s
== 20220524135739 ChangeTableInMigrations: migrated (0.0142s) =================
=end
