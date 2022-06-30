class PasswordResetsController < ApplicationController
  def new

  end

  def create 
    @user = User.find_by_email(params[:email])

    if @user.present?
      PasswordMailer.with(user: @user).reset.deliver_later
      redirect_to root_path, notice: "Sent the link to reset the password "
    else
      redirect_to root_path, notice: "Sent the link to reset the password email not present "
    end
  end

  def edit
    @user = User.find_signed(params[:token], purpose: "password_reset")
    # binding.irb to pause the code execution
  rescue ActiveSupport::MessageVerifier::InvalidSignature
      redirect_to sign_in_path, alert: "Password reset link has expired"
  end

  def update
    @user = User.find_signed(params[:token], purpose: "password_reset")
    if @user.update(password_params)
      redirect_to sign_in_path, notice: "Password Reset Successfully"
    else
      render :edit
    end
  end

  private
    
    def password_params
      params.require(:user).permit(:password, :password_confirmation)
    end
end