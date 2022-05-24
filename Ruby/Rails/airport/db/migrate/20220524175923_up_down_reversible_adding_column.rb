class UpDownReversibleAddingColumn < ActiveRecord::Migration[7.0]
  def change
    reversible do |dir|
      dir.up do
        add_column :products, :sku, :integer
      end
      dir.down do
        remove_column :products, :sku
      end
    end
  end
end
