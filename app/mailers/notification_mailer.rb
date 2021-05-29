class NotificationMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notification_mailer.create_project.subject
  #
  def create_booking(booking)
    @booking = booking
    @greeting = "Bonjour XXXX_USER, nous avons bien reçu votre demande de RDV a très vite"
    mail( to: "zref78@gmail.com", :subject => '[TEST] - Multi-Emails ??? création de booking')
  end
end
