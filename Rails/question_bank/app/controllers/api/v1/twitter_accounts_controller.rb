class Api::V1::TwitterAccountsController <ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    twitter_accounts = TwitterAccount.all
    render json: {data: ActiveModelSerializers::SerializableResource.new(twitter_accounts, each_serializer: TwitterAccountSerializer)}
  end

  def show
    twitter_account = TwitterAccount.find_by(id: params[:id])
    render json: {data: TwitterAccountSerializer.new(twitter_account)}
  end

  def create
    twitter_accounts = TwitterAccount.new twitter_account_params
    if twitter_accounts.save
      render json: {data: TwitterAccountSerializer.new(twitter_accounts)}
    else
      render json: {data: twitter_accounts.errors}
    end
  end

  def update

  end

  def destroy
    twitter_account = TwitterAccount.find_by(id: params[:id])
    twitter_account.destroy
    render json: {data: "Successfully disconnected @#{twitter_account.name}"}
  end

  def twitter_account_params
    params.require(:twitter_account).permit(:user_id, :name, :username)
  end


end