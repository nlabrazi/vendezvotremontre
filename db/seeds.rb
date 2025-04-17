require "open-uri"
require "dotenv"
require 'net/http'
require 'uri'

def download_image(url, filename)
  filepath = Rails.root.join("tmp", filename)

  # Télécharger l'image avec curl
  system("curl -L -A 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36' '#{url}' -o '#{filepath}'")

  # Vérifier si le fichier a bien été téléchargé
  if File.exist?(filepath)
    File.open(filepath)
  else
    raise "Échec du téléchargement de l'image depuis #{url}"
  end
end

Dotenv.load

ActionMailer::Base.perform_deliveries = false

p " ********************************* "
p " *                               * "
p " *         BEGIN OF SEED         * "
p " *                               * "
p " ********************************* "

p "Destroy curent data..."

p "Destroying Bookings... #{Booking.count} "
Booking.destroy_all
p "Destroying Watchs... #{Watch.count} "
Watch.destroy_all
p "Destroying Models... #{Model.count} "
Model.destroy_all
p "Destroying Brands... #{Brand.count} "
Brand.destroy_all
p "Destroying Scopes... #{Scope.count} "
Scope.destroy_all
p "Destroying Conditions... #{Condition.count} "
Condition.destroy_all
p "Destroying User... #{User.count} "
User.destroy_all
p "-----------------------"
p "-----------------------"



p "Creating users..."

photo_user = URI.open("https://www.parlons-basket.com/wp-content/uploads/2020/02/lebron-james-flex-702x459.jpg")
user1 = User.create! password: "123456", email: "lebron.james@yopmail.com", first_name: "Lebron", last_name: "James", phone: "0652770554"
user1.avatar.attach(io: photo_user, filename: 'user_picture', content_type: 'image/jpg')

photo_user = URI.open("https://avatars3.githubusercontent.com/u/50252768?s=460&u=771234958e06149be6f3f50992b664cee81e1ce2&v=4")
user2 = User.create! password: "123456", email: "nabster@yopmail.com", first_name: "Nabil", last_name: "GoodFellas", phone: "0652770555"
user2.avatar.attach(io: photo_user, filename: 'user_picture', content_type: 'image/jpg')

photo_user = URI.open("https://pbs.twimg.com/profile_images/1014211496442843136/IWMl3QfY_400x400.jpg")
user3 = User.create! password: "123456", email: "vendezvotremontre.fr@yopmail.com", first_name: "Admin", last_name: "Leboss", phone: "0650403020", is_admin: true
user3.avatar.attach(io: photo_user, filename: 'user_picture', content_type: 'image/jpg')

p "#{User.count} created..."
p "-----------------------"
p "-----------------------"
puts "#{tp User.all}"


p "Creating scopes..."

Full    = Scope.create! name:"Montre avec coffret et papiers d'origine", id: 1
Paper   = Scope.create! name:"Montre avec papiers d'origine",            id: 2
Box     = Scope.create! name:"Montre avec boite d'origine",              id: 3
Nothing = Scope.create! name:"Montre uniquement",                        id: 4

p "#{Scope.count} created..."
p "-----------------------"
p "-----------------------"
puts "#{tp Scope.all}"



p "Creating conditions..."

New    = Condition.create! name:"Neuf (sans traces d'usure)",     id: 1
Good   = Condition.create! name:"Bon (traces d'usure légères",    id: 2
Bad    = Condition.create! name:"Mauvais (fortement usagée)",     id: 3
Broken = Condition.create! name:"Incomplet (éléments manquants)", id: 4

p "#{Condition.count} created..."
p "-----------------------"
p "-----------------------"
puts "#{tp Condition.all}"



p "Creating brands..."

Rolex    = Brand.create! name: "Rolex",     id: 1
Oris     = Brand.create! name: "Oris",      id: 2
IWC      = Brand.create! name: "IWC",       id: 3
Seiko    = Brand.create! name: "Seiko",     id: 4
Longines = Brand.create! name: "Longines",  id: 5
Hublot   = Brand.create! name: "Hublot",    id: 6
Omega    = Brand.create! name: "Omega",     id: 7

p "#{Brand.count} created..."
p "-----------------------"
p "-----------------------"
puts "#{tp Brand.all}"



p "Creating models..."

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/images_32/s3/3514332_xxl.jpg", "submariner.jpg")
model1 = Model.create!(brand_id: 1, name: "Submariner")
model1.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/images_63/s0/11376063_xxl_v1559519862199.jpg", "hulk.jpg")
model2 = Model.create!(brand_id: 1, name: "Hulk")
model2.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/images_32/s4/11763432_xxl_v1564056434638.jpg", "date engine.jpg")
model3 = Model.create!(brand_id: 2, name: "Date Engine")
model3.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/15564090-be44ybg21ildc0zso6f9jfyq-ExtraLarge.jpg", "oris montre y.jpg")
model4 = Model.create!(brand_id: 2, name: "Oris montre Y")
model4.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/15869519-hnyb0ux8qgas90lrsfh4n2gi-ExtraLarge.jpg", "iwc montre c.jpg")
model5 = Model.create!(brand_id: 3, name: "IWC montre C")
model5.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/images_51/s6/9489651_xxl.jpg", "iwc montre x.jpg")
model6 = Model.create!(brand_id: 3, name: "IWC montre X")
model6.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/9447672-ob6jnlc589fzx2dviza98xwl-ExtraLarge.jpg", "astron.jpg")
model7 = Model.create!(brand_id: 4, name: "Astron")
model7.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/14958910-5ldvwjpp6q34ed0huiojzr1g-ExtraLarge.jpg", "seiko montre w.jpg")
model8 = Model.create!(brand_id: 4, name: "Seiko montre W")
model8.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/images_20/s3/4997320_xxl.jpg", "hydroconquest.jpg")
model9 = Model.create!(brand_id: 5, name: "Hydroconquest")
model9.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/15494335-s4mqy7u0tfkucz89tafbb5hq-ExtraLarge.jpg", "longines montre v.jpg")
model10 = Model.create!(brand_id: 5, name: "Longines montre V")
model10.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/15840524-cpqqlreal42coxnjqd7zze37-ExtraLarge.jpg", "tourbillon.jpg")
model11 = Model.create!(brand_id: 6, name: "Tourbillon")
model11.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/images_60/s1/10895160_xxl_v1554361797854.jpg", "hublot montre u.jpg")
model12 = Model.create!(brand_id: 6, name: "Hublot montre U")
model12.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/11282057-06m9rbdwupv2va5phrmyxelv-Large.jpg", "constellation.jpg")
model13 = Model.create!(brand_id: 7, name: "Constellation")
model13.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

photo_model = download_image("https://cdn2.chrono24.com/images/uhren/15255107-ipfe55jmigrhf7m4dwfisykx-ExtraLarge.jpg", "omega montre t.jpg")
model13 = Model.create!(brand_id: 7, name: "Omega montre T")
model13.photo.attach(io: photo_model, filename: 'model_picture', content_type: 'image/jpg')

p "#{Model.count} created..."
p "-----------------------"
p "-----------------------"
puts "#{tp Model.all}"



p " ********************************* "
p " *                               * "
p " *          END OF SEED          * "
p " *                               * "
p " ********************************* "


p "TOTAL #{User.count} users created"
p "TOTAL #{Brand.count} brands created"
p "TOTAL #{Model.count} models created"
p "TOTAL #{Watch.count} watches created"

ActionMailer::Base.perform_deliveries = true
