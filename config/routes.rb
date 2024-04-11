Rails.application.routes.draw do
  resources :users, only: [:index, :show]

  resources :posts, only: [:index, :show, :create, :destroy] do
    resources :likes, only: [:create, :destroy], shallow: true
    resources :comments, only: [:index, :create, :destroy], shallow: true
    resources :bookmarks, only: [:create, :destroy], shallow: true
  end

  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root "posts#index"
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")

end
