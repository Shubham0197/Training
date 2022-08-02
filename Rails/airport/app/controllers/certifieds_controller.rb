class CertifiedsController < ApplicationController
  def index
    @certifieds = Certified.includes(:pilots, :aircraft)
  end

  def new
    @certified = Certified.new
    @aircrafts = Aircraft.pluck(:name, :id)
    @pilots = Employee.pluck(:name, :id)
  end

  def create
    certified = Certified.new(certified_params)
    if certified.save
      flash[:message] = "Pilot has been certified for the Aircraft"
      redirect_to(certifieds_path)
    else
      flash[:alert] = certified.errors.full_messages
      redirect_to(new_certified_path)
    end
  end

  def edit
    @certified = Certified.find(params[:id])
    @aircrafts = Aircraft.pluck(:name, :id)
    @pilots = Employee.pluck(:name, :id)
  end

  def update
    @certified = Certified.find(params[:id])
    if @certified.update(certified_params)
      flash[:notice] = 'Certified Mapping updated'
      redirect_to(certifieds_path)
    else
      render('edit')
    end
  end

  def destroy
    certified = Certified.find(params[:id])
    if certified.destroy
      flash[:notice] = 'Certifieds destroyed'
      redirect_to(certifieds_path)
    end
  end

  private
  
  def certified_params
    params.require(:certified).permit( :aircraft_id, :employee_id )
  end

end
