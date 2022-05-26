class CreateProductTableUsingMethodsInIt < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.text :name
      t.float :price
      t.integer :categoryid
      t.timestamps
    end
    create_table :categories do |t|
      t.text :name
      t.float :description
    end
    add_column :products, :description, :string
    rename_column :products, :categoryid, :category_id
    add_timestamps :categories
    change_column_null :products, :updated_at, true 
    remove_timestamps :products
    add_foreign_key :products, :categories
    remove_foreign_key :products, :categories
    remove_timestamps :categories
    add_index :categories, :name
    rename_index :categories, 'index_categories_on_name', 'index_productcategories_on_name'
    remove_index :categories, :name
    remove_column :products, :description
    add_reference :categories, :name, index: true
    remove_reference :categories, :name, index: false

  end
end

=begin
Output of the migrations
itsacheckmate@itsacheckmate:~/Training/Ruby/Rails/ecommerce$ rails db:migrate
== 20220524132220 CreateProductTableUsingMethodsInIt: migrating ===============
-- create_table(:products)
   -> 0.0035s
-- create_table(:categories)
   -> 0.0027s
-- add_column(:products, :description, :string)
   -> 0.0007s
-- rename_column(:products, :categoryid, :category_id)
   -> 0.0016s
-- add_timestamps(:categories)
   -> 0.0010s
-- change_column_null(:products, :updated_at, true)
   -> 0.0005s
-- remove_timestamps(:products)
   -> 0.0005s
-- add_foreign_key(:products, :categories)
   -> 0.0011s
-- remove_foreign_key(:products, :categories)
   -> 0.0025s
-- remove_timestamps(:categories)
   -> 0.0007s
-- add_index(:categories, :name)
   -> 0.0014s
-- rename_index(:categories, "index_categories_on_name", "index_productcategories_on_name")
   -> 0.0004s
-- remove_index(:categories, :name)
   -> 0.0013s
-- remove_column(:products, :description)
   -> 0.0004s
-- add_reference(:categories, :name, {:index=>true})
   -> 0.0017s
-- remove_reference(:categories, :name, {:index=>false})
   -> 0.0004s
== 20220524132220 CreateProductTableUsingMethodsInIt: migrated (0.0208s) ======
=end

