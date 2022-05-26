class CreateCertifieds < ActiveRecord::Migration[7.0]
  def change
    create_table :certifieds do |t|
      t.integer :employee_id
      t.integer :aircraft_id
      t.timestamps
    end
  end
end
