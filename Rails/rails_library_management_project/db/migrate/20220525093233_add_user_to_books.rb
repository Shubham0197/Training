class AddUserToBooks < ActiveRecord::Migration[7.0]
  def change
    change_table :distributors do |t|
      t.belongs_to :publisher
    end 
  end
end

