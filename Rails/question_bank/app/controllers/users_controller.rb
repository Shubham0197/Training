class UsersController < ApplicationController
  before_action :require_user_logged_in!, only: [:edit, :update]
  
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

  def edit

  end

  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Password successfully Updated"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
  def password_params
    params.require(:user).permit(:password, :password_confirmation)
  end

end
