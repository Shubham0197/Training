class AircraftController < ApplicationController
  layout 'aircraft'
  helper_method :formatted_date
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
      CrudNotificationMailer.create_notification(@aircraft)
      flash[:notice] = 'Aircraft Added'
      redirect_to(aircraft_index_path)
    end
  end
  
  def edit
    @aircraft = Aircraft.find(params[:id])
  end

  def update
    @aircraft = Aircraft.find(params[:id])
    if @aircraft.update(aircraft_params)
      flash[:notice] = 'Aircraft updated'
      redirect_to(aircraft_path(@aircraft))
    else
      render('edit')
    end
  end

  def delete
    @aircraft = Aircraft.find(params[:id])
  end

  def destroy
    @aircraft = Aircraft.find(params[:id])
    if @aircraft.destroy
      flash[:notice] = 'Aircraft destroyed'
      redirect_to(aircraft_index_path)
    end
  end
  private

    def formatted_date
      date.strftime('%A, %b %d %Y') if date.present?
    end

end
