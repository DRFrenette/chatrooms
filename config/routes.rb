Rails.application.routes.draw do
  root 'chatrooms#index'
  devise_for :users
end
