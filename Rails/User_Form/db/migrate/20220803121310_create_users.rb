class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    enable_extension 'uuid-ossp'
    enable_extension 'pgcrypto'
    
    create_table :users, id: :uuid do |t|
      t.string :name, null: false
      t.date :date_of_birth, null: false
      t.text :address
      t.string :mobile_number
      t.integer :salary
      t.string :email
      t.timestamps
    end
  end
end
