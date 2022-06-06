class Certified < ApplicationRecord
  belongs_to :pilots, class_name: "Employee" , :foreign_key => :employee_id , counter_cache: :count_of_pilots
  #validates :employee_id, numericality: { odd: true, less_than_or_equal_to: 20}
  #validates :aircraft_id, numericality: { even: true, greater_than: 2, only_integer: true}
  #validates :aircraft_id, uniqueness: {scope: :employee_id}
end
