class RemoveBookIdFromAuthorsBooks < ActiveRecord::Migration[7.0]
  def change
    remove_column :authors_books, :book_id, :bigint
  end
end
