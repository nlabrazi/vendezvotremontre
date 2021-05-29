class UserMailer < ApplicationMailer

  def welcome_email(user)
    #on récupère l'instance user pour ensuite pouvoir la passer à la view en @user
    @user = user

    #on définit une variable @url qu'on utilisera dans la view d’e-mail
    @url  = 'http://vendezvotremontre.herokuapp.com/users/sign_in'

    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @user.email, subject: 'Bienvenue chez Vendez Votre Montre !')
  end

  def reservation_email(booking)
    @user = booking.user
    @booking = booking
    @url  = 'http://vendezvotremontre.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: 'Confirmation réservation !')
  end

  def reservation_watch_email(booking)
    @user =  booking.watch
    @booking = booking
    @url  = dashboard_index_url
    mail(to: @user.email, subject: 'Nouvelle réservation !')
  end

  def confirmation_booking(booking)
    @user =  booking.user
    @booking = booking
    @url  = 'http://vendezvotremontre.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: "Ton RDV a été confirmée.")
  end

  def refuse_booking(booking)
    @user =  booking.user
    @booking = booking
    @url  = 'http://vendezvotremontre.herokuapp.com/users/sign_in'
    mail(to: @user.email, subject: "Malheuresemement ton RDV a été refusée.")
  end

end
