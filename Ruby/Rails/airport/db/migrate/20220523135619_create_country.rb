class CreateCountry < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :citiy

      t.timestamps
    end
  end
end
