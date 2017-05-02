Rails.application.routes.draw do
  root "chatrooms#index"
  resources :chatrooms, only: [:index, :new, :create, :show] do
    resource :chatroom_users, only: [:create, :destroy]
    resources :messages, only: [:create]
  end
  devise_for :users, controllers: { sessions: "sessions", registrations: "registrations" }
end
