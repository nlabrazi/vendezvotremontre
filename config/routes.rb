Rails.application.routes.draw do
  ActiveAdmin.routes(self)
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'
  get '/mentions', to: 'pages#mentions'

  #resources :contacts, only: [:new, :create]
  get '/contact', to: 'pages#contact'
  get '/faq', to: 'pages#faq'

  resources :models
  resources :dashboard, only: [:index]
  resources :bookings, only: [:index, :destroy, :update]

  resources :watches do
    resources :bookings, only: [:show, :create, :new]
  end

end
