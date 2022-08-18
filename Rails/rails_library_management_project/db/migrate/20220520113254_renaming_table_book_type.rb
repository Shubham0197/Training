class RenamingTableBookType < ActiveRecord::Migration[7.0]
  def change
    rename_table('book_tpes', 'book_types')
  end
end
