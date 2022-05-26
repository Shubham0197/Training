class AddingForeignKeyInCertifiedTable < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :certifieds, :aircrafts
    add_foreign_key :certifieds, :employees
  end
end
