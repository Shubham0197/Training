class CreatePages < ActiveRecord::Migration[7.0]
  def change
    create_table :pages do |t|
      t.belongs_to :contents
      t.integer :number
      t.timestamps
    end
  end
end
