class AddingForegnKeyInBooksTableFromPublishersTable < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :books, :publishers 
  end
end
