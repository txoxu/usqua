Rails.application.routes.draw do
  get 'home', to: 'pages#home'
  get 'mypage', to: 'pages#mypage'
  root "static_pages#top"

  get 'login', to: 'user_sessions#new'
  post 'login', to: 'user_sessions#create'
  delete 'logout', to: 'user_sessions#destroy'

  get "password/reset", to: "password_resets#new"
  post "password/reset", to: "password_resets#create"
  get "password/reset/edit", to: "password_resets#edit"
  patch "password/reset/edit", to: "password_resets#update"
  mount LetterOpenerWeb::Engine, at: '/letter_opener' if Rails.env.development?
  
  resources :users, only: %i[new create show edit update destroy]
    resources :cocktails do
      resources :cocktail_tastings, only: %i[create new edit update destroy]
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

  resources :distilleries, only: %i[index show]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
end
