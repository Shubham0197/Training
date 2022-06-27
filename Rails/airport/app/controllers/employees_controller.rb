class EmployeesController < ApplicationController
  def index
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    @employee.save!
    if @employee.save!
      CrudNotificationMailer.create_notification(@employee).deliver_later
      flash[:notice] = 'Aircraft Added'
      redirect_to(aircraft_index_path)
    end
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end
  private
    def employee_params
      params.require(:employee).permit(:name, :mobile_number, :DOB, :salary, :trainer_id, :image, :content)
    end
end
