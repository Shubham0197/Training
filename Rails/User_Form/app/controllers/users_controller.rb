class UsersController < ApplicationController
  def index
    @users = User.all.order("name")
  end

  def new
    @user =  User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to(users_path)
    else 
      render :new
    end
  end

  def update
    user = User.find(params[:id])
    user.update(user_params)
    if user.save
      redirect_to(users_path)
    else 
      render :edit
    end 
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    redirect_to(users_path)
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :address, :date_of_birth, :mobile_number, :salary)
  end
end
