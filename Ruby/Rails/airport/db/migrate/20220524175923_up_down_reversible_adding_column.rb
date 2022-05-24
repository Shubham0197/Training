class UpDownReversibleAddingColumn < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :products, :sku, :integer
       x =  execute " select * from flights"
       x.each_row {|a| print a, "\n"}
      end
      dir.down do
        remove_column :products, :sku
      end
    end
  end
end

=begin
output
itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/airport$ rails db:migrate:up VERSION=20220524175923
== 20220524175923 UpDownReversibleAddingColumn: migrating =====================
-- add_column(:products, :sku, :integer)
   -> 0.0011s
-- execute(" select * from flights")
   -> 0.0006s
[1, "Bangalore", "Pune", 360, "10:45:00", "12:00:00", 10000, 2022-05-23 19:50:08.619182 UTC, 2022-05-23 19:50:08.619182 UTC]
[2, "Bangalore", "Delhi", 5000, "12:15:00", "04:30:00", 25000, 2022-05-23 19:50:08.619182 UTC, 2022-05-23 19:50:08.619182 UTC]
[3, "Bangalore", "Mumbai", 3500, "02:15:00", "05:25:00", 30000, 2022-05-23 19:50:08.619182 UTC, 2022-05-23 19:50:08.619182 UTC]
[4, "Delhi", "Mumbai", 4500, "10:15:00", "12:05:00", 35000, 2022-05-23 19:50:08.619182 UTC, 2022-05-23 19:50:08.619182 UTC]
[5, "Delhi", "Pune", 18000, "07:15:00", "05:30:00", 90000, 2022-05-23 19:50:08.619182 UTC, 2022-05-23 19:50:08.619182 UTC]
[6, "Mumbai", "Delhi", 19500, "10:00:00", "07:45:00", 95000, 2022-05-23 19:50:08.619182 UTC, 2022-05-23 19:50:08.619182 UTC]
[7, "Pune", "Banglore", 17000, "12:00:00", "06:30:00", 99000, 2022-05-23 19:50:08.619182 UTC, 2022-05-23 19:50:08.619182 UTC]
[8, "Pune", "Mumbai", 3060, "13:00:00", "14:00:00", 10000, 2022-05-23 19:50:08.619182 UTC, 2022-05-23 19:50:08.619182 UTC]
[9, "Mumbai", "Delhi", 5000, "14:15:00", "16:30:00", 25000, 2022-05-23 19:50:08.619182 UTC, 2022-05-23 19:50:08.619182 UTC]
== 20220524175923 UpDownReversibleAddingColumn: migrated (0.0020s) ============

itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/airport$ 
=end

  
else
  
end