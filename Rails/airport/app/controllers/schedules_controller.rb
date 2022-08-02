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
    if (@aircraft.availability+1.hour <= @flight.departs && 
       @pilot.availability+1.hour <= @flight.departs &&
       @aircraft.place == @flight.from && 
       @pilot.place == @flight.from &&
       DateTime.now+4.hour >= @flight.departs &&
       @flight.status == 'NotScheduled' ) 
         @schedule.update(flight_id: @flight.id, aircraft_id: @aircraft.id, employee_id: @pilot.id, status: 'Scheduled')
         if @schedule.save 
           @flight.update(status: 1)
           @pilot.update(place: @flight.destination, availability: @flight.arrives )
           @aircraft.update(place: @flight.destination, availability: @flight.arrives )
           redirect_to(schedules_path)
         end
    else
      flash[:alert] = ['Schedule for aircraft not created'] 

      if @aircraft.availability+1.hour > @flight.departs || @aircraft.place != @flight.from
        flash[:alert] += ['Aircraft not availble for this flight']
      end

      if @pilot.availability+1.hour > @flight.departs || @pilot.place != @flight.from
        flash[:alert] += ['Pilot not available for this flight']
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

      if @flight.status == 'Cancelled'
        flash[:alert] += ['This flight is already Cancelled']
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
