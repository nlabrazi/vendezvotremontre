class Watch < ApplicationRecord

  belongs_to :user
  belongs_to :brand
  belongs_to :model

  has_one_attached :photo
  has_many :booking

  after_create :send_watch

  def scope_watch
    case scope
    when 1
      "Full Set"
    when 2
      "Papers"
    when 3
      "Box"
    when 4
      "Nothing"
    end
  end

  def state_watch
    case state
    when 1
      "New"
    when 2
      "Good"
    when 3
      "Bad"
    when 4
      "Broken"
    end
  end

  def send_watch
    @client = Twilio::REST::Client.new
    @client.messages.create({
     media_url: ['https://images.unsplash.com/photo-1545093149-618ce3bcf49d?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=668&q=80https://res.cloudinary.com/nabs/image/upload/zh8uezkdhulk7960phr9gcf5mn4m'],
     from: 'whatsapp:+14155238886',
     to: 'whatsapp:+33786167270',
     body: "Hello une nouvelle montre est arrivée go check !"
   })
  end

end
