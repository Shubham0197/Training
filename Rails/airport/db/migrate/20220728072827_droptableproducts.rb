class Droptableproducts < ActiveRecord::Migration[7.0]
  def change
    drop_table :products
    drop_table :authors_books
  end
end
