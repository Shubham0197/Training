class SchedulesController < ApplicationController
  before_action :authenticate_employee!
  before_action :require_admin_access!, except: [:index]
  def require_admin_access!
    redirect_to root_path, notice: "You must be Admin to do that." unless current_employee.account_type == "ADMIN"
  end

  def require_pilot_access!
    redirect_to root_path, notice: "You must be Pilot  to do that." unless current_employee.account_type == "PILOT"
  end

  def index
    if current_employee.account_type == "PILOT"
      @schedules = Schedule.all.where(employee_id: current_employee.id)
    else
      @schedules = Schedule.all
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
    if (@aircraft.availability+1.hour <= @flight.departs && 
       @pilot.availability+1.hour <= @flight.departs &&
       @aircraft.place == @flight.from && 
       @pilot.place == @flight.from &&
       DateTime.now+4.hour >= @flight.departs &&
       @flight.status == 'NotScheduled' ) 
        @flight.update(status: 1)
        @pilot.update(place: @flight.destination, availability: @flight.arrives )
        @aircraft.update(place: @flight.destination, availability: @flight.arrives )
        @schedule.update(flight_id: @flight.id, aircraft_id: @aircraft.id, employee_id: @pilot.id, status: 'Scheduled')
        redirect_to(schedules_path)
    else
      flash[:alert] = ['Schedule for aircraft not created'] 

      if @aircraft.availability+1.hour > @flight.departs || @aircraft.place != @flight.from
        flash[:alert] += ['Aircraft not availble for this flight']
      end

      if @pilot.availability+1.hour > @flight.departs || @pilot.place != @flight.from
        flash[:alert] += ['Pilot now available for this flight']
      end

      if DateTime.now+4.hour < @flight.departs
        flash[:alert] += ['Can not schedule flight more than 4 hours from now']
      end

      if @flight.status == 'Scheduled'
        flash[:alert] += ['This flight is already scheduled']
      end

      if @flight.status == 'Completed'
        flash[:alert] += ['This flight is already Completed']
      end

      flash[:alert] += @schedule.errors.full_messages
      redirect_to( new_schedule_path)
    end
  end

  def edit

  end

  def update

  end

  def destroy
    @schedule = Schedule.find(params[:id])
    @flight = Flight.find(@schedule.flight_id)
    @pilot = Employee.find(@schedule.employee_id)
    @aircraft = Aircraft.find(@schedule.aircraft_id)
    if DateTime.now+1.hour < @schedule.flight.departs
      @flight.update(status: 3)
      @pilot.update(availability: DateTime.now, place: @schedule.flight.from)
      @aircraft.update(availability: DateTime.now, place: @schedule.flight.from)
      @schedule.destroy
    else
      flash[:alert] = ['Schedule for this cannot be destroyed as no time left'] 
    end
    redirect_to(schedules_path)
  end

  private
  def schedule_params
    params.require(:schedule).permit(:from, :destination, :flight, :aircraft, :pilot)    
  end
end
