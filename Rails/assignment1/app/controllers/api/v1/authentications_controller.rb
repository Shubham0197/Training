class Api::V1::AuthenticationsController <ApplicationController
  skip_before_action :verify_authenticity_token

  def login
    @user = User.find_by(email: params[:email])

    if (!@user)
      render json: { Error: "Invalid Email"}
    elsif @user.authenticate(params[:password])
      render json: {message: "Correct Password "}
    else
      render json: {message: "InCorrect Password "}
    end


  end
end
