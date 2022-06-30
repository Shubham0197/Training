class UsersController < ApplicationController
  def index
    @users = User.all
  end
  def new
    @user = User.new
  end
  def create 
    @user = User.new(user_params)
    if @user.save
      #can also use cookies[:user_id] but it will not be encrypte but seesion will be so no body can change it
      session[:user_id] = @user.id
      redirect_to root_path, notice: "Successfully Create Account"
    else
      flash[:alert] = "Details Entered Incorrectly"
      render :new
    end
    
  end
  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
