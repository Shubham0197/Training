class CertifiedsController < ApplicationController
  def index
    @certifieds = Certified.all
  end

  def new
    @certified = Certified.new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
    @flight = Flight.find(params[:id])
    if @flight.destroy
      flash[:notice] = 'Certifieds destroyed'
      redirect_to(certifieds_path)
    end
  end

end
