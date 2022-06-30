class PasswordResetsController < ApplicationController
  def new

  end

  def create 
    @user = User.find_by_email(params[:email])

    if @user.present?
      #send Email
      #PasswordMailer.with(user :@user).reset.deliver_later
      redirect_to root_path, notice: "Sent the link to reset the password "
    else
      redirect_to root_path, notice: "Sent the link to reset the password email not present "
    end
  end
end