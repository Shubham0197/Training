class CreateProductOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_options,id: false , primary_key: :product_option do |t|
      t.text :product_option
      t.integer :product_id
      t.index :product_id, :unique => true 
    end
  end
end

=begin
output of error of unique working
3.0.0 :003 > option.save()
  TRANSACTION (0.1ms)  BEGIN
  ProductOption Create (0.6ms)  INSERT INTO "product_options" ("product_option", "product_id") VALUES ($1, $2)  [["product_option", nil], ["product_id", 1]]                   
  TRANSACTION (1.2ms)  COMMIT                                 
 => true                                                      
3.0.0 :004 > option = ProductOption.new()
 => #<ProductOption:0x00007fa6c85d8a88 product_option: nil, product_id: nil> 
3.0.0 :005 > option.product_id= 1
 => 1 
3.0.0 :006 > option.save()
  TRANSACTION (0.1ms)  BEGIN
  ProductOption Create (0.7ms)  INSERT INTO "product_options" ("product_option", "product_id") VALUES ($1, $2)  [["product_option", nil], ["product_id", 1]]
  TRANSACTION (0.1ms)  ROLLBACK
/home/itsacheckmate/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.3/lib/active_record/connection_adapters/postgresql_adapter.rb:768:in `exec_params': PG::UniqueViolation: ERROR:  duplicate key value violates unique constraint "index_product_options_on_product_id" (ActiveRecord::RecordNotUnique)
DETAIL:  Key (product_id)=(1) already exists.
/home/itsacheckmate/.rvm/gems/ruby-3.0.0/gems/activerecord-7.0.3/lib/active_record/connection_adapters/postgresql_adapter.rb:768:in `exec_params': ERROR:  duplicate key value violates unique constraint "index_product_options_on_product_id" (PG::UniqueViolation)
DETAIL:  Key (product_id)=(1) already exists.
3.0.0 :007 > 
=end