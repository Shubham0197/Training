class CreatePapers < ActiveRecord::Migration[7.0]
  def change
    create_table :papers do |t|
      t.string :title
      t.string :author
      t.integer :publication_year

      t.timestamps
    end
  end
end
