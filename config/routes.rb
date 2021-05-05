Rails.application.routes.draw do
  root "articles#index"
  resources :articles do
    resources :comments, only: [:create]
    resources :votes, only: [:create, :destroy]
  end
  resources :categories, only: [:show]
  get "signup", to: "users#new"
  delete "signout", to: "sessions#destroy"
  resources :users, except: [:new]
  get "login", to: "sessions#new"
  post "login", to: "sessions#create"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
