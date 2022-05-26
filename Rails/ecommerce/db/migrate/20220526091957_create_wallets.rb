class CreateWallets < ActiveRecord::Migration[7.0]
  def change
    create_table :wallets do |t|
      t.string :name
      t.float :amount
      t.integer :lock_version, default: 0, null: false
      t.string :type
      t.timestamps
    end
  end
end
