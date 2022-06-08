class CreateParagraphs < ActiveRecord::Migration[7.0]
  def change
    create_table :paragraphs do |t|
      t.references :pages, foreign_key: true
      t.string :heading
      t.string :description
      t.timestamps
    end
  end
end
