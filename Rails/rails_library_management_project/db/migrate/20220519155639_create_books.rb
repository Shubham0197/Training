class CreateBooks < ActiveRecord::Migration[7.0]
  def change
    create_table :books do |t|
      t.text :title
      t.text :volume
      t.integer :publisher_id
      t.integer :quantity
      t.integer :issued_quantity
      t.integer :type_id
      t.timestamps
    end
  end
end
