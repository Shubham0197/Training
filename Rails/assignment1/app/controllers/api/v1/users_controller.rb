class Api::V1::UsersController <ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    users = User.all.order(:id)
    render json: {data: ActiveModelSerializers::SerializableResource.new(users, each_serializer: UserSerializer)}
  end

  def show
    user = User.find(params[:id])
    render json: {data: UserSerializer.new(user)}
  end

  def create
    user = User.new user_params
    if user.save
      Sidekiq::Client.enqueue_to_in("default", Time.now + 2.seconds, MailWorker, user.email, user.first_name)
      render json: {data: UserSerializer.new(user)}
    else
      render json: {data: user.errors}
    end
  end


  def update
    user = User.find(params[:id])
    user.update user_params
    if user.save
      Sidekiq::Client.enqueue_to_in("default", Time.now + 2.seconds, MailWorker, user.email, user.first_name)
      render json: {data: UserSerializer.new(user)}
    else
      render json: {data: user.errors}
    end
  end

  def destroy
    user = User.find(params[:id])
    user.destroy
    render json: {data: "Successfully deleted  #{user.first_name}"}
  end
  
  private
  def user_params
    params.require(:user).permit(:first_name, :last_name, :gender, :state, :avatar, :email, :password, :about)
  end

end