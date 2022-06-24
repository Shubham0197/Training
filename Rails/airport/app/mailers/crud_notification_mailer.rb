class CrudNotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notification_mailer.create_notification.subject
  #
  def create_notification(object)
    @object = object
    @object_count = object.class.count
   
    @greeting = "Hi"

    mail to: "jjshubhamjj@gamil.com", subject: "A new entry for #{object.class} has been created"
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.crud_notification_mailer.delete_notification.subject
  #
  def delete_notification
    @greeting = "Hi"

    mail to: "to@example.org"
  end
end
