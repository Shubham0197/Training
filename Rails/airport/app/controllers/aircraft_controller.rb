class AircraftController < ApplicationController
  def index
    @aircrafts = Aircraft.all
  end

  def show
    @aircraft = Aircraft.find(params[:id])
  end
end
