class AddPolymorphicAssociations < ActiveRecord::Migration[7.0]
  def change
#    add_column :orders, :oderable_id, :bigint
#    add_column :orders, :oderable_type, :string
    add_reference :orders, :orderable, polymorphic: true
    end
end
