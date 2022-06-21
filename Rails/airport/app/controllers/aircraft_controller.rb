class AircraftController < ApplicationController
  def index
    @aricrafts = Aircraft.all
  end

  def show
  end
end
