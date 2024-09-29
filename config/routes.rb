# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations',
    sessions: 'users/sessions',
    passwords: 'users/passwords'
  }

  root 'static_pages#top'
  get 'home', 'mypage', 'explanation', to: 'pages#home'
  post 'update_badge_seen', to: 'whiskeys#update_badge_seen'

  resources :users, only: %i[show edit update destroy]
  
  resources :cocktails do
    resources :cocktail_tastings, except: %i[index show]
    collection { get :bookmarks }
  end
  
  resources :bookmarks, only: %i[create destroy]
  
  resources :whiskeys do
    member { get 'choose_next_step' }
    resources :tastings, except: %i[index show]
  end
  
  resources :distilleries, only: :index

  resources :contacts, only: %i[new create] do
    collection do
      post 'confirm', 'back'
      get 'confirm', to: redirect('/contacts/new')
      get 'done'
    end
  end
end
