Rails.application.routes.draw do
  resources :categories
  devise_for :users
  resources :expenses
  resources :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'users#index'
end
