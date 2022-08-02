class SchedulesController < ApplicationController
  before_action :authenticate_employee!
  before_action :require_admin_access!, except: [:index]

  def index
    if current_employee.account_type == "PILOT"
      @schedules = Schedule.includes(:employee, :flight, :aircraft).where(employee_id: current_employee.id)
    elsif current_employee.account_type == "ADMIN"
      @schedules = Schedule.includes(:employee, :flight, :aircraft)
    else
      redirect_to root_path, notice: "You must be Either admin or Pilot  to do that."
    end
  end

  def new
    @schedule = Schedule.new
    @flights = Flight.all
  end

  def create
    @flight = Flight.find(schedule_params[:flight])
    @pilot = Employee.find(schedule_params[:pilot])
    @aircraft = Aircraft.find(schedule_params[:aircraft])
    @schedule = Schedule.new()
    if helpers.create_schedule?
      redirect_to(schedules_path)
    else
      redirect_to( new_schedule_path)
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @schedule = Schedule.find(params[:id])
    helpers.destroy_schedule
    redirect_to(schedules_path)
  end

  private
  def schedule_params
    params.require(:schedule).permit(:from, :destination, :flight, :aircraft, :pilot)    
  end
end
