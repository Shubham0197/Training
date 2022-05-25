class CreateProductOptions < ActiveRecord::Migration[7.0]
  def change
    create_table :product_options,id: false , primary_key: :product_option do |t|
      t.text :product_option
      t.integer :product_id
    end
  end
end
