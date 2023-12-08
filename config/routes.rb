Rails.application.routes.draw do
  resources :achievements
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :significant_projects
  resources :publications
  resources :academic_backgrounds
  resources :departments
  resources :interests
  resources :faculties
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "faculties#index"
end
