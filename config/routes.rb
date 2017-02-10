Rails.application.routes.draw do
  devise_for :users, only: %i(session registration)

  root 'chats#index'
end
