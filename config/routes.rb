Rails.application.routes.draw do
  get 'home/about'
  devise_for :users
  #resources :units
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  #resources :departments


  namespace :admin do
    resources :imports
  end

  resources :complaints, only: [:index, :new, :create, :edit, :update] do
    member do
      patch :update_status
      patch :update_bsnl_status
    end
    collection do
      get :show_telephone_stats
    end
  end

  get 'utility/history'

  resources :faculties do
    get 'print', on: :collection
    get 'filter_and_print', on: :collection
    get 'faculties/:id', to: 'faculties#show', as: 'faculty'
  end

  get 'utility/import_interface', as: 'import_interface'
  post 'utility/import', as: 'import_data'

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
      resources :designations
  end
end

  root "faculties#index"

  get 'home/about'
  get 'home/team'
  get 'faculties/print'
  post 'faculties/print'

  devise_scope :user do
     get '/users/sign_out' => 'devise/sessions#destroy'
  end


end
