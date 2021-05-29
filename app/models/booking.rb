class Booking < ApplicationRecord

  belongs_to :user
  belongs_to :watch

  #after_create :booking_new_send

  def booking_new_send
    UserMailer.welcome_email(self).deliver_now
  end

end
