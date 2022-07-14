class UsersController < ApplicationController
  def index
    @users = User.all.order("id")
  end

  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path, notice: "Successfully Create Account"
    else
      flash[:alert] = "Details Entered Incorrectly"
      render :signup
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update user_params
    if @user.save
      redirect_to root_path, notice: "Updated User"
    else
      flash[:alert] = "Details Entered Incorrectly"
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :avatar, :address, :gender)
  end
end
