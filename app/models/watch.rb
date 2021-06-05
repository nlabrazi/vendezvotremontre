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
      "Montre avec coffret et papiers d'origine"
    when 2
      "Montre avec papiers d'origine"
    when 3
      "Montre avec boite d'origine"
    when 4
      "Montre uniquement"
    end
  end

  def state_watch
    case state
    when 1
      "Neuf (sans traces d'usure)"
    when 2
      "Bon (traces d'usure légères"
    when 3
      "Mauvais (fortement usagée)"
    when 4
      "Incomplet (éléments manquants)"
    end
  end

  def send_watch_whatsapp
    img_watch = Watch.last.model.photo.service_url
    body_watch = (Watch.last.brand.name + ' ' + Watch.last.model.name)
    TwilioClient.new.send_whatsapp(body_watch, img_watch)
  end

end
