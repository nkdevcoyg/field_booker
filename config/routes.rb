Rails.application.routes.draw do
  root to: 'pages#home'
  get 'pages/index'
  namespace :admin do
    resources :fields
  end

  get "field/index" => "fields#index"
  resources :fields, only: [:index, :show]
  devise_for :users

  get "booking/index" => "bookings#index"
  resources :bookings
end


# resources :fields, :only => [:index, :show]
# resources :bookings, :only => [:index, :show]
# resources :users, :only =>[:create, :show]