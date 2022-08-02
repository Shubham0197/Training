class Certified < ApplicationRecord
  belongs_to :pilots, class_name: "Employee" , :foreign_key => :employee_id , counter_cache: :count_of_pilots, optional: true
  belongs_to :aircraft
  validates :aircraft_id, uniqueness: {scope: [:employee_id], message: "This mapping already exists"}
end
