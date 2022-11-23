Rails.application.routes.draw do
  get 'courses', to: "courses#index"
  get 'courses/show', to: "courses#show"
  get 'courses/new', to: "courses#new"
  get 'courses/edit', to: "courses#edit"
  devise_for :users
  root 'pages#home'
  get "/profile", to: "pages#profile"
  resources :users
  resources :users do
    member do
      get :courses
    end
  end
  resources :courses
  resources :enrolls, only: [:create]
  resources :courses do
    member do
      get :lesson
    end
  end
  resources :lessons, only: [:create, :destroy, :show]
  resources :words
  resources :examples
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
