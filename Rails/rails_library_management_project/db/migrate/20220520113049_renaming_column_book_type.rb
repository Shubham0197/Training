class RenamingColumnBookType < ActiveRecord::Migration[7.0]
  def change
    rename_column :book_tpes, :subtype, :sub_type
  end
end
