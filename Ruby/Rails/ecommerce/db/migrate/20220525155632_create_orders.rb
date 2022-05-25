class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    enable_extension 'pgcrypto'
    create_table :orders, id: :uuid do |t|
      t.integer :customer_id
      t.float :amount
      t.integer :product_id
      t.timestamps
    end
  end
end

=begin
output
 3.0.0 :006 > Order.all
  Order Load (0.6ms)  SELECT "orders".* FROM "orders"
 =>                                                          
[#<Order:0x000056512a5abac8                                  
  id: "8498a3a5-68b0-4e2e-b61a-a19d8ff6c74d",                
  customer_id: nil,                                          
  amount: 10.0,                                              
  product_id: nil,                                           
  created_at: Wed, 25 May 2022 16:03:38.344790000 UTC +00:00,
  updated_at: Wed, 25 May 2022 16:03:38.344790000 UTC +00:00>]
=end