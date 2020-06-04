Rails.application.routes.draw do
  devise_for :users
  resources :books
  get 'books/home'
  get 'books/users'
  root 'books#home'
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end