Rails.application.routes.draw do
  resources :books, only: [:show, :destroy]
  resources :publishers
  resource :profile, only: [:show, :edit, :destroy]
end
