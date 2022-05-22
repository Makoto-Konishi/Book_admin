Rails.application.routes.draw do
  get 'profiles/show'
  get 'profiles/edit'
  get 'profiles/update'
  resources :books, only: [:show, :destroy]
  resources :publishers
end
