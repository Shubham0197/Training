class UsersController < ApplicationController
  def index
    @users = User.order(:last_name, :first_name)
  end

  def show
  end

  def new
    @user = User.new
  end
  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, {:department_ids => []} )
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = 'User created'
      redirect_to(users_path)
    end
  end

  def edit
  end

  def update
  end

  def delete
  end

  def destroy
  end
end
