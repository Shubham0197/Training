class HomepageController < ApplicationController
  def index
    flash[:notice] = "Logged in Successfully"
    flash[:alert] = "Invalid email or password"
  end

  def about 

  end
end
