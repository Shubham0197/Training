class MailWorker
  include Sidekiq::Worker

  def perform(email, first_name)
    @email = email
    @first_name= first_name
    UserConfirmationMailer.welcome(@email, @first_name).deliver_later
  end
end
