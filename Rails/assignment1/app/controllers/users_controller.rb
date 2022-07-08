require 'json'
require 'rest_client'
require 'open-uri'

class UsersController < ApplicationController 
  RECORDS_PER_PAGE = 10

  def index
    @page = params.fetch(:page,0).to_i
    if params[:search]
      @users_count = User.where('lower(first_name) LIKE ?', "%#{params[:search].downcase}%").count
      @users = User.where('lower(first_name) LIKE ?', "%#{params[:search].downcase}%").order(:id).offset(@page * RECORDS_PER_PAGE).limit(RECORDS_PER_PAGE)
    else
      @users_count = User.all.count
      @users = User.all.order(:id).offset(@page * RECORDS_PER_PAGE).limit(RECORDS_PER_PAGE)
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
  
  def api
    url = "https://reqres.in/api/users?page=2"
    response = RestClient.get(url)
    data_h = JSON.parse(response)
    print data_h.keys
    @counter = 0
    data_h['data'].each do |user|
      @email      = user['email']
      @first_name = user['first_name']
      @last_name  = user['last_name']
      @avatar     = user['avatar']
      @user = User.new(email: @email, first_name: @first_name, last_name: @last_name, avatar: @avatar)
      if @user.save
        Sidekiq::Client.enqueue_to_in("default", Time.now + 2.seconds, MailWorker, @user.email, @user.first_name)
        @counter +=1 
      else
        flash[:alert] = "Details Entered Incorrectly"
        render :new
      end
    end
    if @counter > 1
      redirect_to root_path, notice: "Added New User from API"
    end
  end

  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :state, :avatar, :email, :password, :about, hobbys: [])
  end
end