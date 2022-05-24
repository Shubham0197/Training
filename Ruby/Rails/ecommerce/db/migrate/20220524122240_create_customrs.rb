class CreateCustomrs < ActiveRecord::Migration[7.0]
  def change
    create_table :customrs do |t|
      t.string :name
      t.string :mobile_number
      t.integer :email_address
      t.date :DOB

      t.timestamps
    end
  end
end
