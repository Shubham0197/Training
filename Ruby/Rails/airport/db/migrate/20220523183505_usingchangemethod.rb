class Usingchangemethod < ActiveRecord::Migration[7.0]
  def change
    remove_timestamps :countries
    remove_column :countries, :citiy
  end
end
