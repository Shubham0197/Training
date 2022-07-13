class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :name
      t.string :gender
      t.string :avatar
      t.string :address
      t.timestamps
    end
  end
end
