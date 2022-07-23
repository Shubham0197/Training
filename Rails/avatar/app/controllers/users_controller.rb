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

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    redirect_to root_path, notice: "Deleted User"
  end

  def sorting
    previous_sort_by = params[:previous_sort_by]
    sort_by = params[:sort_by]
    sort_type = params[:sort_type]

    if previous_sort_by == sort_by
      if sort_type == 'asc'
        sort_type = 'desc'
        params[:sort_type] = 'desc'
      else
        sort_type = 'asc'
        params[:sort_type] = 'asc'
      end
    end
    @users = User.all.order(sort_by+" "+sort_type)
  end

  private
  def user_params
    params.require(:user).permit(:name, :avatar, :address, :gender)
  end
end
