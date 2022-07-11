class Api::V1::AssignmentsController <ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    assignments = Assignment.allocate

    render json: {assignments: assignments }
  end

  def create
    authorization_header = request.headers[:authorization]

    if !authorization_header
      render status: :unauthorized
    else
      token = authorization_header.split("")[1][0]
      secret_key = Rails.application.secrets.secret_key_base[0]
      decoded_token = JWT.decode(token, secret_key)[0]

      user = User.find(decoded_token["user_id"])
      assignment = Assignment.create(
        name: params[:name]
        user: user
      )
  
      render json: {assignment: assignment}
    end

  end
end