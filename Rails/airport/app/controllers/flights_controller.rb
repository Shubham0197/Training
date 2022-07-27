class FlightsController < ApplicationController

  def index
    @flights = Flight.all
  end

  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    puts @flight.save!
    if @flight.save
      CrudNotificationMailer.create_notification(@flight)
      flash[:notice] = 'Aircraft Added'
      redirect_to(flights_index_path)
    end
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight.update(flight_params)
      flash[:notice] = 'Flight Schedule updated'
      redirect_to(flights_path(@flight))
    else
      render('edit')
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    if @flight.destroy
      flash[:notice] = 'Flight Schedule destroyed'
      redirect_to(flight_index_path)
    end
  end
  private

  def flight_params
    params.require(:flight).permit(:from,:destination, :distance, :departs, :arrives, :price)
  end
end
