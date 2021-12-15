Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/index'

  namespace :admin do
    resources :fields, :bookings, :users
  end

  devise_for :users

  get "field/index" => "fields#index"
  resources :fields, only: [:index, :show]


  get "booking/index" => "bookings#index"
  post '/booking/create' => 'booker#create'
  resources :bookings


  resources :fields do
    resources :bookings
  end

end

