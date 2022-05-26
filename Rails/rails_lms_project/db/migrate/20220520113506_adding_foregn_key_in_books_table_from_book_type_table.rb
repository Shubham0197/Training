class AddingForegnKeyInBooksTableFromBookTypeTable < ActiveRecord::Migration[7.0]
  def change
    add_column :books, :book_type_id, :integer
    add_foreign_key :books, :book_types
    remove_column :books, :type_id
  end
end
