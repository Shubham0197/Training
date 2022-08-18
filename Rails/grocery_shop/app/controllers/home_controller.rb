class HomeController < ApplicationController
  
  def index
    @roles = Role.all
  end

  def user

  end
end
