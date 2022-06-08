class Employee < ApplicationRecord
  has_many :certifieds
  has_many :trainee, class_name: "Employee" , foreign_key: "trainer_id"
  belongs_to :trainer, class_name: "Employee", optional: true
end
