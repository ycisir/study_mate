Rails.application.routes.draw do
  root "rooms#index"
  resources :rooms
  devise_for :users  
end
