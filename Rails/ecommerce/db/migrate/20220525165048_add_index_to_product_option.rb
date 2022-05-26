class AddIndexToProductOption < ActiveRecord::Migration[7.0]
  disable_ddl_transaction!
  def change
    add_index :product_options, :product_option, algorithm: :concurrently
  end
end

=begin
ouput
if simple index created it takes longer time and also locks the table
itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/ecommerce$ rails db:migrate
== 20220525165048 AddIndexToProductOption: migrating ==========================
-- add_index(:product_options, :product_option)
   -> 0.2261s
== 20220525165048 AddIndexToProductOption: migrated (0.2262s) =================
and 
for concurrently algorithm
  itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/ecommerce$ rails db:migrate
== 20220525165048 AddIndexToProductOption: migrating ==========================
-- add_index(:product_options, :product_option, {:algorithm=>:concurrently})
   -> 0.0023s
== 20220525165048 AddIndexToProductOption: migrated (0.0024s) =================

=end