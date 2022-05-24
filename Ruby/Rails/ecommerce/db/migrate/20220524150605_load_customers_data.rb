require 'active_record/fixtures'
class LoadCustomersData < ActiveRecord::Migration[7.0]
  def self.up 
    down
    directory = File.join(File.dirname(__FILE__), "data")
    Fixtures.create_fixtures(directory, "customers")
  end
  def self.down 
    Customer.delete_all 
  end
end