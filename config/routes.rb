Rails.application.routes.draw do
  resources :transactions
  resources :categories
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  resources :categories, only: [:index, :show, :new, :create] do
    resources :transactions, only: [:new, :create]
  end
  resources :transactions, only: [:new, :create]
  root "wallet#home"
end
