class Api::V1::AssignmentsController <ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    assignments = Assignment.all

    render json: {assignments: assignments } 
  end

  def create
    
      assignment = Assignment.create(
        name: params[:name],
        user: @user
      )
  
      render json: {assignment: assignment}

  end
end