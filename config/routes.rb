Rails.application.routes.draw do
  get 'home', to: 'pages#home'
  get 'mypage', to: 'pages#mypage'

  # ルートをホームページに設定
  root to: 'pages#home'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :whiskeys do
    member do
      get 'choose_next_step'
    end
    resource :tasting, only: [:new, :create, :edit, :update, :show, :destroy]
  end

  resources :tags, only: [:index, :show]
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"
end
