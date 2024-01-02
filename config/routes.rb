Rails.application.routes.draw do
  get 'home/about'
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

  # root "faculties#index"

  namespace :api do
    namespace :v1 do
      resources :departments
      resources :faculties
      resources :units
      resources :faculty_desig
      resources :faculty_by_name
      resources :faculty_by_all
      resources :faculty_by_department
  end
end

  root "faculties#index"

  get 'home/about'
  get 'home/team'

  devise_scope :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
  end


end
