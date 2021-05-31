class Watch < ApplicationRecord

  belongs_to :user
  belongs_to :brand
  belongs_to :model

  has_one_attached :photo
  has_many :booking

  #after_create :send_watch_whatsapp

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

  def send_watch_whatsapp
    img_watch = Watch.last.model.photo.service_url
    body_watch = (Watch.last.brand.name + ' ' + Watch.last.model.name)
    TwilioClient.new.send_whatsapp(body_watch, img_watch)
  end

end
