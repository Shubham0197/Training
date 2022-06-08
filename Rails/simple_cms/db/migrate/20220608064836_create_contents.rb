class CreateContents < ActiveRecord::Migration[7.0]
  def change
    create_table :contents do |t|
      t.string :title
      t.string :url
      t.timestamps
    end
  end
end
