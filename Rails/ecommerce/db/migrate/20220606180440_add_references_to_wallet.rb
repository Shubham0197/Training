class AddReferencesToWallet < ActiveRecord::Migration[7.0]
  def change
    add_reference :wallets, :customr
  end
end
