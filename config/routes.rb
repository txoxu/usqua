Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  get 'home', to: 'pages#home'
  get 'mypage', to: 'pages#mypage'
  root 'static_pages#top'
  get 'demo', to: 'pages#demo'


resources :users, only: %i[show edit update destroy]
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
    resources :tastings, only: %i[new create edit update destroy]
  end
  resources :distilleries, only: %i[index]

    resources :contacts, only: %i[new create] do
      collection do
        post 'confirm'
        get 'confirm', to: redirect('/contacts/new')
        post 'back'
        get 'done'
      end
    end
  
  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.

  # Defines the root path route ("/")
  # root "posts#index"

end
