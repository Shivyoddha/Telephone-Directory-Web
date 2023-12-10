Rails.application.routes.draw do
  devise_for :users
  resources :units
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :departments
  resources :faculties
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  namespace :admin do
    resources :imports, only: [:new, :create]
  end

  root "faculties#index"

  namespace :api do
  namespace :v1 do
    resources :departments
    resources :faculties
    resources :units
  end
end

end
