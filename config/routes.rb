Rails.application.routes.draw do
  devise_for :users, only: [:session, :registration]

  root 'chats#index'
end
