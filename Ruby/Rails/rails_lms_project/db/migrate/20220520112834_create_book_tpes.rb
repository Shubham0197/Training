class CreateBookTpes < ActiveRecord::Migration[7.0]
  def change
    create_table :book_tpes do |t|
      t.text :type
      t.text :subtype
      t.timestamps
    end
  end
end
