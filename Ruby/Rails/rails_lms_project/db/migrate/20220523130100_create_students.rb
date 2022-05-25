class CreateStudents < ActiveRecord::Migration[7.0]
  def change
    create_table :students do |t|
      t.text :name
      t.text :email_id
      t.text :mobile_number
      t.timestamps
    end
  end
end
