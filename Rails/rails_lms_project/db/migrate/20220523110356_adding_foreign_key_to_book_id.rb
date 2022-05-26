class AddingForeignKeyToBookId < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :book_authors, :books
    add_foreign_key :book_authors, :authors
  end
end
