Rails.application.routes.draw do

  devise_for :users

  root to: 'homes#top'
  get "home/about" => 'homes#about'
  resources :users, only:[:show, :edit, :index, :update, :new, :crate]
  resources :books, only:[:show, :index, :update, :destroy, :create, :edit]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
