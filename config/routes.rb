Rails.application.routes.draw do
  devise_for :users, only: %i(session registration)
  resources :groups, only: %i(new create edit update)

  root 'chats#index'
end
