class UsersController < ApplicationController
  def index
    @users = User.all.order("name")
  end

  def new
  end

  def edit
  end

  def create
  end

  def update
  end
end
