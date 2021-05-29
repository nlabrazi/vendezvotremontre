Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root to: 'pages#home'

  resources :models
  resources :dashboard, only: [:index]
  resources :bookings, only: [:index, :destroy, :update]

  resources :watches do
    resources :bookings, only: [:show, :create, :new]
  end

end
