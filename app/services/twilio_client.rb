class TwilioClient

  attr_reader :client

  def initialize
    @client = Twilio::REST::Client.new account_sid, auth_token
  end

  def send_whatsapp(body_watch, img_watch)
    url = 'https://vendezvotremontre.herokuapp.com'
    message = @client.messages.create({
     media_url: ["#{img_watch}"],
     from: 'whatsapp:+14155238886',
     #to: 'whatsapp:+33698843255',
     to: 'whatsapp:+33786167270',
     body: "Hello une nouvelle montre est arrivée il s'agit de #{body_watch} vérifie ici #{url} !"
   })
  end

  #private

  def account_sid
    account_sid = ENV['TWILIO_ACCOUNT_SID']
  end

  def auth_token
    auth_token = ENV['TWILIO_AUTH_TOKEN']
  end

  def phone_number
    Rails.application.credentials.twilio[:phone_number]
  end

end
