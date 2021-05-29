# Download the helper library from https://www.twilio.com/docs/ruby/install
require 'rubygems'
require 'twilio-ruby'

# Find your Account SID and Auth Token at twilio.com/console
# and set the environment variables. See http://twil.io/secure
#account_sid = ENV['TWILIO_ACCOUNT_SID']
#auth_token = ENV['TWILIO_AUTH_TOKEN']
account_sid = 'AC1228a342f43f17aadbdc6bd0f398db2a'
auth_token = '87ae074764037775ecd1f63451d92f77'
@client = Twilio::REST::Client.new(account_sid, auth_token)

message = @client.messages.create({
     media_url: ['https://images.unsplash.com/photo-1545093149-618ce3bcf49d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80https://res.cloudinary.com/nabs/image/upload/zh8uezkdhulk7960phr9gcf5mn4m'],
     from: 'whatsapp:+14155238886',
     to: 'whatsapp:+33786167270',
     body: "Hello une nouvelle montre est arrivée go check !"
   })

puts message.sid
