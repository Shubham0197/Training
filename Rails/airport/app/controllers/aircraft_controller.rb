class AircraftController < ApplicationController
  def index
    @aircrafts = Aircraft.all
  end

  def show
    @aircraft = Aircraft.find(params[:id])
    @certifides = @aircraft.certifieds
    @employees = []
    @certifides.each do |certified|
      if certified.employee_id
        @employees << Employee.find(certified.employee_id) 
      end
    end
  end
end
