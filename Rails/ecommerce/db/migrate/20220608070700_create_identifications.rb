class CreateIdentifications < ActiveRecord::Migration[7.0]
  def change
    create_table :identifications do |t|
      t.belongs_to :wallet
      t.bigint :aadhar
      t.text :pan
      t.timestamps
    end
  end
end
