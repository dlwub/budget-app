Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  authenticate :user do    
  end
  
  # be sure to add before default `root`
  authenticated :user do
    root to: "categories#index", as: :authenticated_root
    resources :categories, only: [:index, :new, :create] do
      resources :entities, only: [:index, :new, :create]
    end       
  end
  resources :entities, only: [:new, :create]
  root to: "wallet#home"
end
