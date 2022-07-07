class UsersController < ApplicationController 
  
  def index
    if params[:search]
      @users = User.where('lower(first_name) LIKE ?', "%#{params[:search].downcase}%").order(:id)
    else
      @users = User.all.order(:id)
    end
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
      Sidekiq::Client.enqueue_to_in("default", Time.now + 2.seconds, MailWorker, @user.email, @user.first_name)
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
    @user = User.find(params[:id])
    @user.update user_params
    if @user.save
      redirect_to root_path, notice: "Updated User"
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
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :state, :avatar, :email, :password, :about)
  end
end