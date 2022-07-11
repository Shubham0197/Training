class ApplicationController < ActionController::Base
  before_action :authenticate, only: [:create]

  def authenticate
    authorization_header = request.headers[:authorization]

    if !authorization_header
      render ({json: {error: "Error in the token not authorized"}, status: :unauthorized})
    else
      token = authorization_header.split(" ")[1]
      secret_key = Rails.application.secrets.secret_key_base[0]
      decoded_token = JWT.decode(token, secret_key)[0]

      @user = User.find(decoded_token["user_id"])
    end
  end
end
