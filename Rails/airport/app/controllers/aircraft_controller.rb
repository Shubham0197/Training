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

  def new
    @aircraft = Aircraft.new
  end
  
  def aircraft_params
    params.require(:aircraft).permit(:name, :cruising_range)
  end

  def create
    @aircraft = Aircraft.new(aircraft_params)
    puts @aircraft.save!
    if @aircraft.save
      flash[:notice] = 'Aircraft Added'
      redirect_to(aircraft_indexs_path)
    end
  end

  def update

  end

  def delete

  end

end
