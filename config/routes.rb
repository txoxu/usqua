Rails.application.routes.draw do
  get 'home', to: 'pages#home'
  get 'mypage', to: 'pages#mypage'
  root "static_pages#top"

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'


  resources :users, only: %i[new create]
    resources :cocktails do
      collection do
        get :bookmarks
      end
    end
    resources :bookmarks, only: %i[create destroy]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :whiskeys do
    member do
      get 'choose_next_step'
    end
    resources :tastings, only: %i[new create edit update show destroy]
  end

  resources :tags, only: %i[index show]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
end
