class SchedulesController < ApplicationController
  def index

  end

  def new
    @schedule = Schedule.new
    @flights = Flight.all
  end

  def create

  end

  def edit

  end

  def update

  end

  def destroy

  end


end
