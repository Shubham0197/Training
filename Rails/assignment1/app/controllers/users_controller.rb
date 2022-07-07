class UsersController < ApplicationController 
  
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to root_path, notice: "Created New User"
    else
      flash[:alert] = "Details Entered Incorrectly"
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.new user_params
    if @user.save
      redirect_to root_path, notice: "Updated New User"
    else
      flash[:alert] = "Details Entered Incorrectly"
      render :edit
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "Deleted User"
  end
  
end