# Utilisation de l'image officielle Ruby
FROM ruby:3.1.2

# Définition du dossier de travail
WORKDIR /app

# Installation des dépendances système
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client

# Copie du Gemfile et installation des gems
COPY Gemfile Gemfile.lock ./
RUN gem install bundler && bundle install

# Copie du projet
COPY . .

# Commande de démarrage
CMD ["bash", "-c", "rails db:create db:migrate db:seed && rails server -b 0.0.0.0"]
