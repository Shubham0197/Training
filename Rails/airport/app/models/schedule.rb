class Schedule < ApplicationRecord
  belongs_to :flight
  belongs_to :aircraft
  belongs_to :employee
  validates :aircraft_id, presence: true
  validates :employee_id, presence: true
  validates :flight_id, presence: true
  validate :pilot_aircraft_certified?

  
  private
  def pilot_aircraft_certified?
    aircraft = Aircraft.find(aircraft_id)
    employee = Employee.find(employee_id)
    if (employee.certified_ids && aircraft.certified_ids)
      true
    else
      false
    end
  end



end
