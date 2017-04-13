Rails.application.routes.draw do
  devise_for :users, only: %i(session registration)
  resources :groups

  root 'chats#index'
end
