
Rails.application.routes.draw do
  resources :departments do
    member do
      get 'faculties', to: 'departments#faculties'
    end
  end
  resources :faculties
  resources :units
  resources :users
end
