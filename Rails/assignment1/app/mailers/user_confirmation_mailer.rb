class UserConfirmationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_confirmation_mailer.welcome.subject
  #
  def welcome(email, first_name)
    @email = email
    @first_name= first_name
    mail to: @email
  end
end
