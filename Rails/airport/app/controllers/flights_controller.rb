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
  end

  def update
    response.headers.delete "X-Frame-Options"
  end

  def destroy
  end

  private

  def flight_params
    params.require(:flight).permit(:from,:destination, :distance, :departs, :arrives, :price)
  end
end
