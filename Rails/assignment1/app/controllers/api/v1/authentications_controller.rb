class Api::V1::AuthenticationsController <ApplicationController
  skip_before_action :verify_authenticity_token

  def login
    @user = User.find_by(email: params[:email])

    if (!@user)
      render({ json: { Error: "Invalid Email"}, status: :unauthorized })
    elsif @user.authenticate(params[:password])
      secret_key = Rails.application.secrets.secret_key_base[0]
      token = JWT.encode({
        user_id: @user.id,
        email: @user.email,
        exp: 24.hours.from_now.to_i
        }, secret_key )

      render json: {token: token}
    else
      render ({json: {error: "Password Wrong"}, status: :unauthorized })
    end


  end
end
