Rails.application.routes.draw do

  # root "chats#index"
  root "sessions#new"
  get 'login', to: "sessions#new"
  post '/login', to: "sessions#create"
  delete '/logout', to: "sessions#destroy"
  get 'chats',to:"chats#index"

  resources :chats, only: [:show]
  resources :messages, only: [:create]

end
