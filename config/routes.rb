Rails.application.routes.draw do
  devise_for :users, only: %i(session registration)
  resources :groups, only: %i(new create edit update) do
    resources :messages, only: %i(index create update)
  end

  root 'messages#index'
end
