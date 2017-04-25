Rails.application.routes.draw do
  root "chatrooms#index"
  resources :chatrooms, only: [:index, :new, :create]
  devise_for :users
end
