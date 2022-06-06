class Certified < ApplicationRecord
  belongs_to :pilots, class_name: "Employee" , :foreign_key => :employee_id , counter_cache: :count_of_pilots, dependent: :destroy, optional: true
  belongs_to :aircraft, dependent: :delete,  validate: true , inverse_of: :certifieds, touch: :AddColumnToCertified#true
  #validates :employee_id, numericality: { odd: true, less_than_or_equal_to: 20}
  #validates :aircraft_id, numericality: { even: true, greater_than: 2, only_integer: true}
  #validates :aircraft_id, uniqueness: {scope: :employee_id}
end
