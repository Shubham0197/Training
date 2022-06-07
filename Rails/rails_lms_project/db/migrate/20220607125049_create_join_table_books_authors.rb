class CreateJoinTableBooksAuthors < ActiveRecord::Migration[7.0]
  def change
    create_join_table :books, :authors do |t|
      t.index [:author_id, :book_id]
    end
  end
end
