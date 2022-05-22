Rails.application.routes.draw do
  resources :books, only: [:show, :destroy]
  resources :publishers
end
