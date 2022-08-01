class Schedule < ApplicationRecord
  belongs_to :flight
  belongs_to :aircraft
  belongs_to :employee
  validate :pilot_aircraft_certified?
  
  private
  def pilot_aircraft_certified?
    if (this.employee.certified_ids&& this.aircraft.certified_ids)
      true
    else
      false
    end
  end



end
