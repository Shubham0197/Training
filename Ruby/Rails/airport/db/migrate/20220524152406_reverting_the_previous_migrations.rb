require_relative "20220524110434_remove_index_employee"

class RevertingThePreviousMigrations < ActiveRecord::Migration[7.0]
  def change
    revert RemoveIndexEmployee
  end
end

=begin
output
itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/airport$ rails db:migrate
== 20220524152406 RevertingThePreviousMigrations: migrating ===================
-- add_index(:employees, :name)
   -> 0.0035s
== 20220524152406 RevertingThePreviousMigrations: migrated (0.0487s) ==========
=end
