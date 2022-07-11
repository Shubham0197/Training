class CreateAssignments < ActiveRecord::Migration[7.0]
  def change
    create_table :assignments do |t|
      t.string :name
      t.belongs_to :user
      t.timestamps
    end
  end
end
