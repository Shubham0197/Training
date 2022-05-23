class CreateJoinTableCertifiedEmployee < ActiveRecord::Migration[7.0]
  def change
    create_join_table :certifieds, :employees do |t|
       t.index [:certified_id, :employee_id]
      # t.index [:employee_id, :certified_id]
    end
  end
end
