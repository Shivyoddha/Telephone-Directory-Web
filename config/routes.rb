Rails.application.routes.draw do
  devise_for :users
  resources :units
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :departments
  resources :faculties
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "faculties#index"
end
