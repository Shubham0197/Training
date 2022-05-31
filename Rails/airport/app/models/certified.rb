class Certified < ApplicationRecord
  validates :employee_id, numericality: { odd: true, less_than_or_equal_to: 20}
  validates :aircraft_id, numericality: { even: true, greater_than: 2, only_integer: true}

end
