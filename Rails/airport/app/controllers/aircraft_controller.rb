class AircraftController < ApplicationController
  before_action :authenticate_employee!
  before_action :require_admin_access!, except: [:index]
  skip_before_action :verify_authenticity_token
  layout 'aircraft'
  helper_method :formatted_date
  def index
    @q = Aircraft.ransack(params[:q])
    @aircrafts = @q.result(distinct: true).page(params[:page])
    puts @aircrafts.count,params[:q],"\n"
  end

  def practice
    @aircrafts = Aircraft.all
  end

  def show
    @aircraft = Aircraft.find(params[:id])
    certifides = @aircraft.certifieds.includes(:pilots)
    @employees = certifides.map(&:pilots)
  end

  def new
    @aircraft = Aircraft.new
  end
  


  def create
    @aircraft = Aircraft.new(aircraft_params)
    puts @aircraft.save!
    if @aircraft.save
      CrudNotificationMailer.create_notification(@aircraft).deliver_now
      flash[:notice] = 'Aircraft Added'
      redirect_to(aircraft_index_path)
    else
      flash[:alert] = @aircraft.errors.full_messages
      redirect_to(new_aircraft_path)
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
      flash[:alert] = @aircraft.errors.full_messages
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

    def formatted_date(date)
      date.strftime('%A, %b %d %Y') if date.present?
    end
    
    def aircraft_params
      params.require(:aircraft).permit(:name, :cruising_range)
    end

end
