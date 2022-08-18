class CreateGroceries < ActiveRecord::Migration[7.0]
  def change
    create_table :groceries do |t|
      t.string :product
      t.float :price

      t.timestamps
    end
  end
end
