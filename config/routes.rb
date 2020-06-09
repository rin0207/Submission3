Rails.application.routes.draw do
  devise_for :users
  resources :books
  get 'books/users'
  resources :users, only: [:show, :edit, :update, :index]
  root :to => 'home#home'
  
  get 'home/about' => 'home#about'
  delete 'books/:id' => 'books#destroy', as: 'destroy_book'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end