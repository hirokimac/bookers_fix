Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:show, :index, :edit, :update, :create, :destroy]
  resources :users, only: [:show, :index, :edit, :update]
  root to: 'home#top'
  get 'home/about' => 'home#about' , as: 'about'
end
