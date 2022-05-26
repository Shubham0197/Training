class AddAddressColumnInPublishersTable < ActiveRecord::Migration[7.0]
  def change
    add_column :publishers, :address, :string
  end
end
