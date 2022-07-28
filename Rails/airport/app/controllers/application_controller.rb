class ApplicationController < ActionController::Base
  before_action :authenticate_employee!

  before_action :configure_permitted_parameters, if: :devise_controller?

  def require_admin_access!
    redirect_to root_path, notice: "You must be Admin to do that." unless current_employee.account_type == "ADMIN"
  end

  def require_pilot_access!
    redirect_to root_path, notice: "You must be Pilot  to do that." unless current_employee.account_type == "PILOT"
  end

  protected

       def configure_permitted_parameters
            devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:name, :email, :password)}

            devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:name, :email, :password, :current_password)}
       end


end
