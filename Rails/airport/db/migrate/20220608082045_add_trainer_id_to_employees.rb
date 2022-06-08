class AddTrainerIdToEmployees < ActiveRecord::Migration[7.0]
  def change
    add_reference :employees, :trainer, foreign_key: { to_table: :employees}
  end
end

