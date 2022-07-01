class OmniauthCallbacksController <ApplicationController
  def twitter
    Rails.logger.info auth

    twitter_account = Current.user.twitter_accounts.where(username: auth.extra.access_token.params[:screen_name]).first_or_initialize
    twitter_account.update(
      name: auth.extra.access_token.params[:screen_name],
      username: auth.extra.access_token.params[:screen_name],
      image: auth.info.image,
      token: auth.credentials.token,
      secret: auth.credentials.secret
    )

    redirect_to root_path, notice: "Successfully connected to your account"
  end

  def auth 
    request.env['omniauth.auth']
  end
end