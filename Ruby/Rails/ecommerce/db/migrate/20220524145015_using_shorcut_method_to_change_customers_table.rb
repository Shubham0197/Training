class UsingShorcutMethodToChangeCustomersTable < ActiveRecord::Migration[7.0]
  def change
    change_table :customers do |t|
      t.remove :sku
      t.change_default :mobile_number, 100000
      t.references :user
      t.belongs_to :products, foreign_key: true
      t.remove_references :user
      t.remove_belongs_to :products, foreign_key: false
      t.timestamps
      t.index  :mobile_number
      t.remove_index :mobile_number
    end
  end
end

=begin
itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/ecommerce$ rails db:migrate
== 20220524145015 UsingShorcutMethodToChangeCustomersTable: migrating =========
-- change_table(:customers)
   -> 0.0157s
== 20220524145015 UsingShorcutMethodToChangeCustomersTable: migrated (0.0157s) 
=end

