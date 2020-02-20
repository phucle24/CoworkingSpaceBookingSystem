Rails.application.routes.draw do
  scope "(:locale)", locale: /en|vi/ do
    get "/about", to: "static_pages#about"
    get "/contact", to: "static_pages#contact"
    root "static_pages#home"
    get  "/signup", to: "users#new"
    post "/signup", to: "users#create"
    get "/login", to: "sessions#new"
    post "/login", to: "sessions#create"
    delete "/logout", to: "sessions#destroy"
    get "admin/venues", to: "manager_venues#index"
    get "admin/venues/edit", to: "manager_venues#edit"
    resources :venues
    resources :manager_venues
    resources :spaces
    resources :password_resets, only: [:new, :create, :edit, :update]
    resources :users
    resources :account_activations, only: :edit
  end
end
