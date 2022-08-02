class EmployeesController < ApplicationController
  before_action :authenticate_employee!
  before_action :require_admin_access!
  
  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      CrudNotificationMailer.create_notification(@employee).deliver_later
      flash[:notice] = 'New Employee Added'
      redirect_to(employees_index_path)
    else
      flash[:alert] = @employee.errors.full_messages
      redirect_to(new_employee_path)
    end
    end
  end

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      flash[:notice] = 'Employee updated'
      redirect_to(employees_index_path)
    else
      flash[:alert] = @employee.errors.full_messages
      render('edit')
    end
  end

  def destroy
    @employee = Employee.find(params[:id])
    if @employee.destroy
      flash[:notice] = 'Employee Details Destroyed'
      redirect_to(employees_index_path)
    end
  end

  private
    def employee_params
      params.require(:employee).permit(:name, :email, :mobile_number, :DOB, :salary, :trainer_id, :image, :content)
    end
end
