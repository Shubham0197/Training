# Preview all emails at http://localhost:3000/rails/mailers/user_confirmation_mailer
class UserConfirmationMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_confirmation_mailer/welcome
  def welcome
    UserConfirmationMailer.welcome
  end

end
