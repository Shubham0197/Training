class AddReversibleUsage < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :customers, :sku, :integer
        change_column :customers, :mobile_number, :string
      end
      dir.down do
        raise ActiveRecord::IrreversibleMigration
      end
    end
  end
end

=begin
Output
itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/ecommerce$ rails db:migrate
== 20220524142535 AddReversibleUsage: migrating ===============================
-- add_column(:customers, :sku, :integer)
   -> 0.0012s
-- change_column(:customers, :mobile_number, :string)
   -> 0.0005s
== 20220524142535 AddReversibleUsage: migrated (0.0018s) ======================

itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/ecommerce$ rails db:rollback STEP = 1
== 20220524142535 AddReversibleUsage: reverting ===============================
rails aborted!
StandardError: An error has occurred, this and all later migrations canceled:

ActiveRecord::IrreversibleMigration
/home/itsacheckmate/Training/Ruby/Rails/ecommerce/db/migrate/20220524142535_add_reversible_usage.rb:9:in `block (2 levels) in change'
/home/itsacheckmate/Training/Ruby/Rails/ecommerce/db/migrate/20220524142535_add_reversible_usage.rb:8:in `block in change'

Caused by:
ActiveRecord::IrreversibleMigration: ActiveRecord::IrreversibleMigration
/home/itsacheckmate/Training/Ruby/Rails/ecommerce/db/migrate/20220524142535_add_reversible_usage.rb:9:in `block (2 levels) in change'
/home/itsacheckmate/Training/Ruby/Rails/ecommerce/db/migrate/20220524142535_add_reversible_usage.rb:8:in `block in change'
Tasks: TOP => db:rollback
(See full trace by running task with --trace)
itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/ecommerce$ rails db:rollback
== 20220524142535 AddReversibleUsage: reverting ===============================
rails aborted!
StandardError: An error has occurred, this and all later migrations canceled:

ActiveRecord::IrreversibleMigration
/home/itsacheckmate/Training/Ruby/Rails/ecommerce/db/migrate/20220524142535_add_reversible_usage.rb:9:in `block (2 levels) in change'
/home/itsacheckmate/Training/Ruby/Rails/ecommerce/db/migrate/20220524142535_add_reversible_usage.rb:8:in `block in change'

Caused by:
ActiveRecord::IrreversibleMigration: ActiveRecord::IrreversibleMigration
/home/itsacheckmate/Training/Ruby/Rails/ecommerce/db/migrate/20220524142535_add_reversible_usage.rb:9:in `block (2 levels) in change'
/home/itsacheckmate/Training/Ruby/Rails/ecommerce/db/migrate/20220524142535_add_reversible_usage.rb:8:in `block in change'
Tasks: TOP => db:rollback
(See full trace by running task with --trace)
=end