# Preview all emails at http://localhost:3000/rails/mailers/crud_notification_mailer
class CrudNotificationMailerPreview < ActionMailer::Preview
  def create_notification
    aircraft = FactoryGirl.create(:aircraft)
    CrudNotificationMailer.create_notification(aircraft)
  end
end
