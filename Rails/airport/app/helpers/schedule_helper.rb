module ScheduleHelper

  def create_schedule?
     if (@aircraft.availability+1.hour <= @flight.departs && 
       @pilot.availability+1.hour <= @flight.departs &&
       @aircraft.place == @flight.from &&
       @aircraft.cruising_range >= @flight.distance && 
       @pilot.place == @flight.from &&
       DateTime.now+4.hour >= @flight.departs &&
       @flight.status == 'NotScheduled' ) 
         @schedule.update(flight_id: @flight.id, aircraft_id: @aircraft.id, employee_id: @pilot.id, status: 'Scheduled')
         if @schedule.save 
           @flight.update(status: 1)
           @pilot.update(place: @flight.destination, availability: @flight.arrives )
           @aircraft.update(place: @flight.destination, availability: @flight.arrives )
           true
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
      false
    end
  end

  def destroy_schedule
    flight = Flight.find(@schedule.flight_id)
    pilot = Employee.find(@schedule.employee_id)
    aircraft = Aircraft.find(@schedule.aircraft_id)
    if DateTime.now+1.hour < @schedule.flight.departs
      flight.update(status: 3)
      pilot.update(availability: DateTime.now, place: @schedule.flight.from)
      aircraft.update(availability: DateTime.now, place: @schedule.flight.from)
      @schedule.destroy
    else
      flash[:alert] = ['Schedule for this cannot be destroyed as no time left'] 
    end
  end

end
